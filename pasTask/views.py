from django.shortcuts import render,redirect,HttpResponse,get_object_or_404
from .models import *
from .forms import *
from django.contrib.auth import login , authenticate,logout
from django.views.generic import CreateView,View,FormView
from django.contrib.auth.forms import AuthenticationForm
from .decorators import *
from django.views.generic import CreateView,View,FormView
from django.contrib.auth.forms import AuthenticationForm
from .decorators import *
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from datetime import datetime, timedelta

class HomeView(View):
    def get(self,req):
        data={
            "postBlock":BlogPost.objects.filter(is_draft=False),
            "category":Category.objects.all(),
        }
        return render(req,"home.html",data)
class DashbordView(View):
    def get(self,req):
        data={
            "user":User.objects.get(pk=req.user.id),
        }
        return render(req,"dashboard.html",data)
class DoctorDashbordView(View):
    def get(self,req):
        data={
            "user":User.objects.get(pk=req.user.id),
        }
        return render(req,"Doctor/doctorDaseboard.html",data)
class DoctorView(CreateView):
    model=Doctor
    form_class=DoctorForm
    template_name="Form/singup.html"
    success_url="/doctor/dashbord/"
    def get_context_data(self,**kwargs):
        kwargs['user_type']="Doctor"
        return super().get_context_data(**kwargs)
    def form_valid(self,form):
        user=form.save()
        login(self.request,user)
        return redirect("DoctorDashbordView")
class PatientView(CreateView):
    model = Patient
    form_class=PatientForm
    template_name="Form/singup.html"
    success_url="/"
    def get_context_data(self,**kwargs):
        kwargs['user_type']="Patient"
        return super().get_context_data(**kwargs)
    def form_valid(self,form):
        user=form.save()
        login(self.request,user)
        return redirect("dasboard")
class LoginView(FormView):
    template_name="Form/login.html"
    form_class=AuthenticationForm
    success_url="/"
    def post(self,request):
        username=request.POST.get("username")
        password=request.POST.get("password")
        user=authenticate(username=username,password=password)
        if user is not None:
            if user.is_active:
                login(request,user)
                back = request.GET.get("next","dasboard")
                return redirect(back)
            else:
                return HttpResponse("Inactivated")
        else:
            return HttpResponse("login cheeking is not correct")
class LogoutView(View):
    def get(self,req):
        logout(req)
        return redirect("login")
    
class DoctorHomeView(View):
    def get(self,req):
        data={
            # "postBlock":BlogPost.objects.filter(is_draft=False),
            "postBlock":BlogPost.objects.all(),
            "category":Category.objects.all(),
        }
        return render(req,"Doctor/DoctorHome.html",data)
@login_required
@doctor_required
def categoryView(req):
    form= CategoryForm(req.POST)
    user_type="Doctor"
    if req.method =="POST":
        if form.is_valid():
            form.save()
            return redirect(create_blog_post)
    return render(req,"Form/cat.html",{"form":form,"user_type":user_type})
@login_required
@doctor_required
def create_blog_post(request):
    user_type="Doctor"
    if request.method == 'POST':
        form = BlogPostForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('DoctorHomeView')
    else:
        form = BlogPostForm()
    return render(request, 'Form/create_blog_post.html', {'form': form,"user_type":user_type})

def patient_blog_list(request):
    posts = BlogPost.objects.filter(is_draft=False)
    return render(request, 'patient_blog_list.html', {'posts': posts})


@login_required
@doctor_required
def singleBlock(req,id):
    singlePost=get_object_or_404(BlogPost,pk=id)
    
    data={
        "category":Category.objects.all(),
        "post":singlePost,
        "related_post":BlogPost.objects.filter(~Q(pk=id) & Q(category__id=singlePost.category.id) )
    }
    return render(req,"Doctor/singleBlock.html",data)
@login_required
@patient_required
def singleBlockPatient(req,id):
    singlePost=get_object_or_404(BlogPost,pk=id)
    
    data={
        "category":Category.objects.all(),
        "post":singlePost,
        "related_post":BlogPost.objects.filter(~Q(pk=id) & Q(category__id=singlePost.category.id) & Q(is_draft=False))
    }
    return render(req,"singleBlock.html",data)

def filterBlock(req,cat_id):
    
    data = {
        "category": Category.objects.all(),
        "postBlock": BlogPost.objects.filter(Q(category=cat_id) & Q(is_draft=False))
    }
    return render(req, "home.html", data)

@login_required
@doctor_required
def approveBlock(req,id):
    single=BlogPost.objects.get(id=id,is_draft=True)
    single.is_draft=False
    single.save()
    return redirect(singleBlock,id)



def doctorList(request):
    doctors = User.objects.filter(is_doctor=True)
    return render(request, 'doctor_list.html', {'doctors': doctors})

def bookAppointment(request, doctor_id):
    doctor = Doctor.objects.get(pk=doctor_id)
    patient = Patient.objects.get(user=request.user)

    if request.method == 'POST':
        form = AppointmentForm(request.POST)
        if form.is_valid():
            appointment = form.save(commit=False)
            appointment.doctor = doctor
            appointment.patient_name = patient
            start_time = datetime.combine(appointment.appointment_date, appointment.start_time)
            end_time = start_time + timedelta(minutes=45)
            appointment.end_time = end_time.time()
            if is_doctor_available(doctor, appointment.appointment_date, appointment.start_time):
                appointment.save()
                return redirect(appointmentConfirmation)
            else:
                doctor_available = False
                return render(request, 'bookAppointment.html', {'doctor': doctor, 'form': form, 'doctor_available': doctor_available})
    else:
        form = AppointmentForm()

    return render(request, 'bookAppointment.html', {'doctor': doctor, 'form': form})

def is_doctor_available(doctor, appointment_date, start_time):
    existing_appointments = Appointment.objects.filter(doctor=doctor, appointment_date=appointment_date, start_time=start_time)
    return not existing_appointments.exists()

def appointmentConfirmation(request):
    appointment = Appointment.objects.all() 
    patient=Patient.objects.get(user=request.user) 
    data={
        "appointment":appointment,
        "patient":patient
    }  
    return render(request, 'confirmationAppointment.html', data)

@login_required
@doctor_required
def listAppointmentPatient(req):
    doctor=Doctor.objects.get(pk=req.user.id)
    patient=Patient.objects.all()
    appointment=Appointment.objects.all()
    # appointment=Appointment.objects.all()
    data={'doctor': doctor, 'patients': patient,"appointment":appointment}
    return render(req, 'Doctor/doctorAppointmentList.html', data)

def chatPage(request, *args, **kwargs):
    context = {}
    return render(request, "chatPage.html", context)