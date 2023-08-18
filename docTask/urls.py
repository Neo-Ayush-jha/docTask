from django.contrib import admin
from django.urls import path
from pasTask.views import *
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('admin/', admin.site.urls),
    path("",HomeView.as_view(),name="home"),
    path("dasboard/",DashbordView.as_view(),name="dasboard"),
    path("doctor/dashbord/",DoctorDashbordView.as_view(),name="DoctorDashbordView"),
    path("singup/doctor/",DoctorView.as_view(),name="doctor_singup"),
    path("singup/patient/",PatientView.as_view(),name="patient_singup"),
    path("login/",LoginView.as_view(),name="login"),
    path("logout/",LogoutView.as_view(),name="logout"),
   
]
urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)