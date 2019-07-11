from django.shortcuts import render

# Create your views here.
def admin_index(request):
    return render(request,"adminindex.html")

def medicine_category(request):
    return render(request,"medicine-type.html")

def medicine_details(request):
    return render(request,"medicine-details.html")

def diseases(request):
    return render(request,"diseases.html")

def symptoms(request):
    return render(request,"symptoms.html")