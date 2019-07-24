from django import forms
from backend_panel.models import MedicinesCategory, MedicineDetails, Diseases, Symptoms, Precautions, Relation


class MedicinesCategoryForm(forms.ModelForm):
    class Meta:
        model = MedicinesCategory
        exclude = ["id","type"]

class MedicineDetailsForm(forms.ModelForm):
    class Meta:
        model = MedicineDetails
        exclude = ["id", "cat", "med_name", "image", "price", "description"]

class DiseasesForm(forms.ModelForm):
    class Meta:
        model = Diseases
        exclude = ["id","dis_name", "precaution"]


class SymptomsForm(forms.ModelForm):
    class Meta:
        model = Symptoms
        exclude = ["id", "symptoms", "dis"]

class PrecautionsForm(forms.ModelForm):
    class Meta:
        model = Precautions
        exclude = ["id", "precautions", "dis"]

class RelationForm(forms.ModelForm):
    class Meta:
        model = Relation
        exclude = ["id", "dis","med"]


