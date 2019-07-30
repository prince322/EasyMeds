from django.conf.urls import url
from first_panel import views

app_name = "first_panel"

urlpatterns = [
    url(r'^home/$', views.index, name='index'),
    url(r'^aleophetic_details/$', views.aleophetic_details),
    url(r'^Homopathy/$', views.homopathic),
    url(r'^Ayurvedic/$', views.ayurvedic),
    url(r'^medicine_detail/$', views.medicine_detail, name="medicine_detail"),
]