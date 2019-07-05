from django.conf.urls import url
from first_panel import views
app_name="first_panel"
urlpatterns=[
    url(r'^registration_page/$',views.registration),

]