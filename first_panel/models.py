from django.db import models


class UserRole(models.Model):
    id = models.AutoField(primary_key=True)
    role = models.CharField(max_length=225,null=True,unique=True)

    def __str__(self):
        return self.role


class RoleDetails(models.Model):
    role = models.ForeignKey(UserRole, on_delete=models.CASCADE)
    name = models.CharField(max_length=225, default="")
    email = models.CharField(max_length=225, primary_key=True)
    password = models.CharField(max_length=225, default="")
    mobile = models.CharField(max_length=225, default="")
    gender = models.CharField(max_length=225, default="",null=True)
    address = models.CharField(max_length=225, default="",null=True)
    otp = models.CharField(max_length=225, default="",null=True)
    otp_time = models.CharField(max_length=225,default="",null=True)
    last_login = models.CharField(max_length=225,default="",null=True)
    active = models.CharField(max_length=225,default="")
    verify_link = models.CharField(max_length=225,default="",null=True)
    auth_token = models.CharField(max_length=225,default="",null=True)


class LoginDetails(models.Model):
    id = models.AutoField(primary_key=True)
    email= models.CharField(max_length=225,default="", null=True)
    log_in = models.CharField(max_length=225, default="", null=True)
    log_out = models.CharField(max_length=225, default="", null=True)
    address = models.CharField(max_length=225, default="", null=True)