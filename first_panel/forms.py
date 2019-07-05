from django import forms
from first_panel.models import RoleDetails

class RoleDetailsForm(forms.ModelForm):
    class Meta:
        model = RoleDetails
        exclude=["role","name","email","password","mobile","gender","address","otp","otp_time","last_login","active","verify_link","auth_token"]