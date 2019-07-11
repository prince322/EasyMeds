from django.conf.urls import url
from backend_panel import views

app_name = "backend_panel"

urlpatterns = [
    url(r'^adminindex/$',views.admin_index),
    url(r'^medicine_category/$',views.medicine_category),
    url(r'^medicine_details/$',views.medicine_details),
    url(r'^diseases/$',views.diseases),
    url(r'^symptoms/$',views.symptoms),
]