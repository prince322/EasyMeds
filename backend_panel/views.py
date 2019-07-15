from django.shortcuts import render, HttpResponse
from backend_panel.forms import MedicinesCategoryForm, MedicineDetailsForm, DiseasesForm, SymptomsForm
from backend_panel.models import MedicinesCategory, MedicineDetails, Diseases, Symptoms

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


def update_category(request):
    data = MedicinesCategory.objects.all()
    return render(request,"category_update.html", {'data': data})


def medicine_details(request):
    data = MedicinesCategory.objects.all()
    if request.method == "POST":
        form = MedicineDetailsForm(request.POST)
        f = form.save(commit=False)
        f.cat_id = request.POST['category']
        f.med_name = request.POST['med_name']
        f.image = request.POST['med_image']
        f.price = request.POST['med_price']
        f.description = request.POST['med_desc']
        f.save()
    return render(request,"medicine-details.html",{'data':data})

def update_medicine(request):
    data = MedicineDetails.objects.all()
    return render(request,"medicine_update.html", {'data': data})

def update_diseases(request):
    data = Diseases.objects.all()
    return render(request,"update_diseases.html", {'data': data})

def update_symptoms(request):
    data = Symptoms.objects.all()
    return render(request,"update_symptoms.html", {'data': data})

def diseases(request):
    if request.method == "POST":
        form = DiseasesForm(request.POST)
        f = form.save(commit=False)
        f.dis_name = request.POST['dis_name']
        f.precaution = request.POST['dis_prec']
        f.save()
    return render(request,"diseases.html")

def symptoms(request):
    data = Diseases.objects.all()
    if request.method == "POST":
        form = SymptomsForm(request.POST)
        f = form.save(commit=False)
        f.dis_id = request.POST['dis_name']
        f.symptoms = request.POST['symptom']
        f.save()
    return render(request,"symptoms.html",{'data':data})