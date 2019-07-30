from django.conf.urls import url
from backend_panel import views

app_name = "backend_panel"

urlpatterns = [

    url(r'^update_category/$',views.update_category),
    url(r'^medicine_category/$',views.medicine_category),
    url(r'^medicine_details/$',views.medicine_details),
    url(r'^update_medicine/$',views.update_medicine),
    url(r'^diseases/$',views.diseases),
    url(r'^symptoms/$',views.symptoms),
    url(r'^precautions/$',views.precautions),
    url(r'^update_diseases/$',views.update_diseases),
    url(r'^update_symptoms/$',views.update_symptoms),
    url(r'^update_precautions/$',views.update_precautions),
    url(r'^edit_category/$',views.edit_med_category, name="edit_category"),
    url(r'^delete_category/$',views.del_med_category,name="delete_category"),
    url(r'^med_details/$',views.edit_med_details,name="med_details"),
    url(r'^delete_med_details/$', views.delete_med_details, name="delete_details"),
    url(r'^edit_diseases/$', views.edit_diseases, name="edit_diseases"),
    url(r'^delete_diseases/$',views.delete_diseases, name="delete_diseases"),
    url(r'^edit_symptoms/$', views.edit_symptoms, name="edit_symptoms"),
    url(r'^delete_symptoms/$',views.delete_symptoms, name="delete_symptoms"),
    url(r'^edit_precautions/$', views.edit_precautions, name="edit_precautions"),
    url(r'^delete_precautions/$', views.delete_precautions, name="delete_precautions"),
    url(r'^aleophetic_details/$', views.aleophetic_details),
    url(r'^medicine_disease_relation/$', views.med_dis_relation),
    url(r'^Homopathy/$', views.homopathic),
    url(r'^Ayurvedic/$', views.ayurvedic),
    url(r'^prescription/$', views.disease),
    url(r'^prescription_detail/$', views.prescription_detail, name="prescription_detail" ),
    url(r'^update_relation/$', views.update_relation),
    url(r'^edit_relation/$', views.edit_relation, name="edit_relation"),
    url(r'^delete_relation/$',views.delete_relation, name="delete_relation"),
    url(r'^gallery/$',views.gallery),
    url(r'^medicine_detail/$',views.medicine_detail, name="medicine_detail"),

]