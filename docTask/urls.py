from django.contrib import admin
from django.urls import path
from pasTask.views import *
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('admin/', admin.site.urls),
    path("",HomeView.as_view(),name="home"),
    path("dasboard/",DashbordView.as_view(),name="dasboard"),
    path("doctor/home/",DoctorHomeView.as_view(),name="DoctorHomeView"),
    path("doctor/dashbord/",DoctorDashbordView.as_view(),name="DoctorDashbordView"),
    path("singup/doctor/",DoctorView.as_view(),name="doctor_singup"),
    path("singup/patient/",PatientView.as_view(),name="patient_singup"),
    path("login/",LoginView.as_view(),name="login"),
    path("logout/",LogoutView.as_view(),name="logout"),
    path('category/', categoryView, name='categoryView'),
    path('create/', create_blog_post, name='blockCreate'),
    path('patient/',patient_blog_list, name='patient_blog_list'),
    path("logout/",LogoutView.as_view(),name="logout"),
    path("view/single/block/<int:id>/",singleBlock,name="singleBlock"),
    path("view/single/block/public/<int:id>/",singleBlockPatient,name="singleBlockPatient"),
    path("approve/block/<int:id>/",approveBlock,name="is_draft"),
    path("filter/<int:cat_id>/",filterBlock,name="filter"),
]
urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)