from django.shortcuts import render, HttpResponse, redirect
from backend_panel.forms import MedicinesCategoryForm, MedicineDetailsForm, DiseasesForm, SymptomsForm, RelationForm, PrecautionsForm
from backend_panel.models import MedicinesCategory, MedicineDetails, Diseases, Symptoms,Relation, Precautions
from django.core.files.storage import FileSystemStorage


# Create your views here.



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
        user_image = None
        try:
            if request.FILES["med_image"]:
                my_file = request.FILES["med_image"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                user_image = fs.url(file_name)
                user_image = my_file.name
        except:
            pass
        f = form.save(commit=False)
        f.cat_id = request.POST['category']
        f.med_name = request.POST['med_name']
        f.image = user_image
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

def update_precautions(request):
    data = Precautions.objects.all()
    return render(request,"update_precautions.html", {'data': data})

def diseases(request):
    if request.method == "POST":
        form = DiseasesForm(request.POST)
        f = form.save(commit=False)
        f.dis_name = request.POST['dis_name']
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

def precautions(request):
    data = Diseases.objects.all()
    if request.method == "POST":
        form = PrecautionsForm(request.POST)
        f = form.save(commit=False)
        f.dis_id = request.POST['dis_name']
        f.precautions = request.POST['precautions']
        f.save()
    return render(request,"precautions.html",{'data':data})


def edit_med_category(request):
    get_id = request.GET['id']
    if request.method == "POST":
        name = request.POST['med_category']
        update = MedicinesCategory(id=get_id, type=name)
        update.save(update_fields=['type'])
    return render(request, "medicine-type.html")

def del_med_category(request):
    get_id = request.GET['id']
    data = MedicinesCategory.objects.get(id=get_id)
    data.delete()
    return redirect("/update_category/")

def edit_med_details(request):
    get_id = request.GET['id']
    data = MedicinesCategory.objects.all()
    if request.method == "POST":
        user_image = None
        try:
            if request.FILES["med_image"]:
                my_file = request.FILES["med_image"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                user_image = fs.url(file_name)
                user_image = my_file.name
        except:
            pass
        category = request.POST['category']
        name = request.POST['med_name']
        image = user_image
        price = request.POST['med_price']
        description = request.POST['med_desc']
        update = MedicineDetails(id=get_id, cat_id=category ,med_name=name,image=image,price=price,description=description)
        update.save(update_fields=['cat_id','med_name','image','price','description'])
    return render(request, "medicine-details.html",{'data':data})

def delete_med_details(request):
    get_id = request.GET['id']
    data = MedicineDetails.objects.get(id=get_id)
    data.delete()
    return redirect("/update_medicine/")

def edit_diseases(request):
    get_id = request.GET['id']
    if request.method == "POST":
        name = request.POST['dis_name']
        update = Diseases(id=get_id,dis_name=name)
        update.save(update_fields=['dis_name'])
    return render(request, "diseases.html")

def delete_diseases(request):
    get_id = request.GET['id']
    data = Diseases.objects.get(id=get_id)
    data.delete()
    return redirect("/update_diseases/")

def edit_symptoms(request):
    get_id = request.GET['id']
    data = Diseases.objects.all()
    if request.method == "POST":
        disease = request.POST['dis_name']
        symptom = request.POST['symptom']
        update = Symptoms(id=get_id, dis_id=disease, symptoms=symptom)
        update.save(update_fields=['dis_id', 'symptoms'])
    return render(request, "symptoms.html",{'data':data})

def delete_symptoms(request):
    get_id = request.GET['id']
    data = Symptoms.objects.get(id=get_id)
    data.delete()
    return redirect("/update_symptoms/")

def edit_precautions(request):
    get_id = request.GET['id']
    data = Diseases.objects.all()
    if request.method == "POST":
        disease = request.POST['dis_name']
        precautions = request.POST['precautions']
        update = Precautions(id=get_id, dis_id=disease, precautions=precautions)
        update.save(update_fields=['dis_id', 'precautions'])
    return render(request, "precautions.html",{'data':data})

def delete_precautions(request):
    get_id = request.GET['id']
    data = Precautions.objects.get(id=get_id)
    data.delete()
    return redirect("/update_precautions/")


def med_dis_relation(request):
    dis_data = Diseases.objects.all()
    med_data = MedicineDetails.objects.all()
    if request.method == "POST":
        form = RelationForm(request.POST)
        f = form.save(commit=False)
        f.dis_id = request.POST['dis_name']
        f.med_id = request.POST['med_name']
        f.save()
    return render(request,"med_dis_relation.html", {"dis_data":dis_data,"med_data":med_data})

def update_relation(request):
    data = Relation.objects.all()
    dis_data = Diseases.objects.all()
    med_data = MedicineDetails.objects.all()
    return render(request, "update_relation.html",{'data':data,'dis_data':dis_data,'med_data':med_data})

def delete_relation(request):
    get_id = request.GET['id']
    data = Relation.objects.get(id=get_id)
    data.delete()
    return redirect("/update_relation/")

def edit_relation(request):
    get_id = request.GET['id']
    dis_data = Diseases.objects.all()
    med_data = MedicineDetails.objects.all()
    if request.method == "POST":
        form = RelationForm(request.POST)
        f = form.save(commit=False)
        f.dis_id = request.POST['dis_name']
        f.med_id = request.POST['med_name']
        f.save()
    return render(request, "med_dis_relation.html", {"dis_data": dis_data, "med_data": med_data})

def disease(request):
    data = Diseases.objects.all()
    return render(request, "prescription.html",{'data':data})

def prescription_detail(request):
    get_id = request.GET['id']
    dis_data = Diseases.objects.get(id=get_id)
    prec_data = Precautions.objects.filter(dis_id = get_id)
    sym_data = Symptoms.objects.filter(dis_id=get_id)
    med_data = Relation.objects.filter(dis_id = get_id )
    m_data = MedicineDetails.objects.all()
    c_data = MedicinesCategory.objects.all()
    return render(request,"prescription_detail.html",{'med_data':med_data,'c_data':c_data,'m_data':m_data,'dis_data':dis_data, 'sym_data':sym_data, 'prec_data':prec_data})

def gallery(request):
    data = MedicineDetails.objects.all()
    return render(request,"gallery.html",{'data':data})





