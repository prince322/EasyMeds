from django.shortcuts import render
from backend_panel.forms import MedicinesCategoryForm, MedicineDetailsForm, DiseasesForm, SymptomsForm
from backend_panel.models import MedicinesCategory

# Create your views here.
def admin_index(request):
    return render(request,"adminindex.html")

def medicine_category(request):
    if request.method == "POST":
        form = MedicinesCategoryForm(request.POST)
        f = form.save(commit=False)
        f.type = request.POST['med_category']
        f.save()
    return render(request,"medicine-type.html")

def medicine_details(request):
    if request.method == "POST":
        form = MedicineDetailsForm
        f = form.save(commit=False)
        f.med_name = request.POST['med_name']
        f.image = request.POST['med_image']
        f.price = request.POST['med_price']
        f.description = request.POSt['med_desc']
        f.save()
    return render(request,"medicine-details.html")

def diseases(request):
    if request.method == "POST":
        form = DiseasesForm
        f = form.save(commit=False)
        f.dis_name = request.POST['dis_name']
        f.precaution = request.POST['dis_prec']
        f.save()
    return render(request,"diseases.html")

def symptoms(request):
    if request.method == "POST":
        form = SymptomsForm
        f = form.save(commit=False)
        f.symptoms = request.POST['symptom']
        f.save()
    return render(request,"symptoms.html")