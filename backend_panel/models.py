from django.db import models

# Create your models here.
class MedicinesCategory(models.Model):
    id = models.AutoField(primary_key=True)
    type = models.CharField(max_length=225,null=True,unique=True)

class MedicineDetails(models.Model):
    id = models.AutoField(primary_key=True)
    cat = models.ForeignKey(MedicinesCategory, on_delete=models.CASCADE)
    med_name = models.CharField(max_length=225,default="")
    image = models.CharField(max_length=225,default="",null=True)
    price = models.CharField(max_length=225,default="",null=True)
    description = models.CharField(max_length=225,default="",null=True)

class Diseases(models.Model):
    id =  models.AutoField(primary_key=True)
    dis_name = models.CharField(max_length=225,default="")
    precaution = models.CharField(max_length=225,default="",null=True)

class Symptoms(models.Model):
    id = models.AutoField(primary_key=True)
    symptoms = models.CharField(max_length=225,default="",null=True)
    dis =  models.ForeignKey(Diseases, on_delete=models.CASCADE)

class Relation(models.Model):
    id = models.AutoField(primary_key=True)
    dis = models.ForeignKey(Diseases, on_delete=models.CASCADE)
    med = models.ForeignKey(MedicineDetails, on_delete=models.CASCADE)
