from django.shortcuts import render, HttpResponse,redirect
from first_panel.forms import RoleDetailsForm
from first_panel.models import RoleDetails, UserRole
from backend_panel.models import MedicineDetails,MedicinesCategory,Diseases, Relation, Precautions, Symptoms
from django.contrib.auth.hashers import make_password,check_password
from miscFiles.genericFunction import generate_string,link_send,otp_generate,otp_send
from django.core.files.storage import FileSystemStorage
from miscFiles.autherize import authorization


def index(request):
    data = Diseases.objects.all()
    a_data = MedicineDetails.objects.filter(cat_id=13)
    h_data = MedicineDetails.objects.filter(cat_id=15)
    y_data = MedicineDetails.objects.filter(cat_id=14)
    half_data = []
    count = 0
    allopath = []
    dount = 0
    homopath = []
    eount = 0
    ayurved = []
    fount = 0
    for i in data:
        if count == 9:
            break
        half_data.append(i)
        count += 1
    for j in a_data:
        if dount == 4:
            break
        allopath.append(j)
        dount +=1
    for k in h_data:
        if eount == 4:
            break
        homopath.append(k)
        eount +=1
    for l in y_data:
        if fount == 4:
            break
        ayurved.append(l)
        fount +=1
    return render(request, "index.html", {'data':half_data,'a_data':allopath,'h_data':homopath,'y_data':ayurved})

def registration(request):
    data = UserRole.objects.all()
    if request.method == "POST":
        form = RoleDetailsForm(request.POST)
        f = form.save(commit=False)
        f.role_id = request.POST['role_id']
        f.name = request.POST['username']
        f.email = request.POST['email']
        f.gender = request.POST['gender']
        f.active = 0
        string = generate_string()
        link = make_password(string)
        link = link.replace("+","")
        f.verify_link = link
        f.save()
        request.session['email'] = f.email
        f_link = "127.0.0.1:8000/verify_link/?link="+link
        link_send(f.email, f_link)
        return render(request, "registration.html",{'confirm' :True})
    return render(request,"registration.html",{'data':data})


def login(request):
    data = Diseases.objects.all()
    a_data = MedicineDetails.objects.filter(cat_id=13)
    h_data = MedicineDetails.objects.filter(cat_id=15)
    y_data = MedicineDetails.objects.filter(cat_id=14)
    half_data = []
    count = 0
    allopath = []
    dount = 0
    homopath = []
    eount = 0
    ayurved = []
    fount = 0
    for i in data:
        if count == 9:
            break
        half_data.append(i)
        count += 1
    for j in a_data:
        if dount == 4:
            break
        allopath.append(j)
        dount += 1
    for k in h_data:
        if eount == 4:
            break
        homopath.append(k)
        eount += 1
    for l in y_data:
        if fount == 4:
            break
        ayurved.append(l)
        fount += 1
    if request.method == "POST":
        get_email= request.POST['username']
        get_password = request.POST['password']
        try:
            data = RoleDetails.objects.get(email=get_email)
            user_password=data.password
            role = data.role_id
            if check_password(get_password, user_password):
                request.session['email'] = data.email
                request.session['role'] = role
                request.session['authenticate'] = True
                request.session['name'] = data.name
                if role == 1:
                    return redirect("/adminindex/",{'data':half_data,'a_data':allopath,'h_data':homopath,'y_data':ayurved})
                elif role == 2:
                    pass
            else:
                return HttpResponse("Please enter correct password")
        except:
            return HttpResponse("Login Failed")
    return render(request,"index.html",{'data':half_data,'a_data':allopath,'h_data':homopath,'y_data':ayurved})


def verify_link(request):
    get_link =request.GET['link']
    session_mail = request.session['email']
    data = RoleDetails.objects.get(email=session_mail)
    db_verify = data.verify_link
    if get_link == db_verify:
        return redirect("/update_password/")


def update_password(request):
    if request.method == "POST":
        user_password = request.POST['new_pass']
        con_password = request.POST['con_pass']
        session_mail = request.session['email']
        data = RoleDetails.objects.get(email=session_mail)
        db_password = data.password
        if user_password == con_password:
            update = RoleDetails(email=session_mail, active=1, verify_link="", password=make_password(con_password))
            update.save(update_fields=['active', 'verify_link', 'password'])
            request.session['email'] = ""
            return redirect("/home/")
        else:
            return HttpResponse("Please enter same password")
    return render(request, "updatePassword.html")


def forgot_password(request):
    if request.method == "POST":
        get_email = request.POST["text"]
        get_password = request.POST["n_pass"]
        get_cpass = request.POST['c_pass']
        if get_email!="" and get_password == "" and get_cpass =="":
            try:
                data = RoleDetails.objects.get(email=get_email)
                otp = otp_generate()
                update = RoleDetails(email=get_email, otp=otp)
                update.save(update_fields=['otp'])
                otp_send(str(otp), get_email)
                request.session['email'] = get_email
                return render(request,"forgotten_password.html", {'otp': True})
            except:
                return HttpResponse("Email not valid")
        elif get_email!="" and get_password != "" and get_cpass !="":
            data = RoleDetails.objects.get(email=request.session['email'])
            db_otp = data.otp
            if get_email == db_otp:
                if get_password == get_cpass:
                    update = RoleDetails(email=request.session['email'], otp="", password=make_password(get_cpass))
                    update.save(update_fields=['otp', 'password'])
                    request.session['email'] = ""
                    return redirect("/")
            return render(request,"forgotten_password.html",{'confirm':True})
    return render(request,"forgotten_password.html")

def admin_index(request):
    auth = authorization(request.session['authenticate'], request.session['role'], 1)
    if auth == True:
        get_email = request.session['email']
        data = RoleDetails.objects.filter(role_id = 4)
        admin_no = RoleDetails.objects.filter(role_id = 1)
        med_data = MedicineDetails.objects.all()
        cat_data = MedicinesCategory.objects.all()
        des_data = Diseases.objects.all()
        m_count = 0
        d_count = 0
        c_count = 0
        u_count = 0
        for i in med_data:
            m_count += 1
        for j in des_data:
            d_count += 1
        for k in cat_data:
            c_count += 1
        for l in data:
            u_count += 1
        return render(request, "adminindex.html",{'m_count':m_count,'d_count':d_count,'c_count':c_count,'u_count':u_count,'data':data,'admin_no':admin_no,'med_data':med_data,'cat_data':cat_data,'des_data':des_data})
    else:
        aut, msg = auth
        if msg == "wrongUser":
            return HttpResponse("You are not a valid user")
        elif msg == "notLogin":
            return HttpResponse("Please login to access this page")

def logout(request):
    request.session['email'] = ""
    request.session['role'] = ""
    request.session['authenticate'] = ""
    request.session['name'] = ""
    return redirect("/")

def admin_update_profile(request):
    if request.method == 'POST':
        get_email = request.session['email']
        user_image = None
        try:
            if request.FILES["image"]:
                my_file = request.FILES["image"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                user_image = fs.url(file_name)
                user_image = my_file.name
        except:
            pass
        get_name = request.POST['Ad_name']
        get_mobile = request.POST['mobile']
        get_address = request.POST['address']
        update = RoleDetails(email=get_email, name=get_name, mobile=get_mobile, address=get_address, image=user_image)
        update.save(update_fields=['name','mobile','address','image'])
        return redirect("/adminindex/")
    return render(request, "admin_update_profile.html")

def admin_update_password(request):
    if request.method == "POST":
        get_email = request.session['email']
        data = RoleDetails.objects.get(email=get_email)
        user_password = request.POST['old_pass']
        n_pass = request.POST['n_pass']
        c_pass = request.POST['c_pass']
        db_pass = data.password
        if check_password(user_password,db_pass):
            if n_pass==c_pass:
                update = RoleDetails(email=get_email,password=make_password(c_pass))
                update.save(update_fields=['password'])
                return redirect("/adminindex/")
            else:
                return HttpResponse("please enter same password")
        else:
            return HttpResponse("please enter correct password")
    return render(request,"admin_update_password.html")

def user_search(request):
    if request.method == "POST":
        get_email = request.POST['email']
        try:
            data = RoleDetails.objects.get(email=get_email)
            return render(request, "user_search.html", {'data':data})
        except:
            return redirect("/adminindex/")

def aleophetic_details(request):
    data = MedicineDetails.objects.filter(cat_id=13)
    return render(request, "alphetic.html", {'data':data})

def homopathic(request):
    data =  MedicineDetails.objects.filter(cat_id=15)
    return render(request, "homopathic.html",{'data':data})

def ayurvedic(request):
    data =  MedicineDetails.objects.filter(cat_id=14)
    return render(request, "Ayurvedic.html",{'data':data})

def medicine_detail(request):
    auth = authorization(request.session['authenticate'], request.session['role'], 4)
    if auth == True:
        get_id = request.GET['id']
        m_data = MedicineDetails.objects.get(id=get_id)
        c_id = m_data.cat_id
        c_data = MedicinesCategory.objects.get(id=c_id)
        des_data = Relation.objects.get(med_id = get_id)
        return render(request, "next_page.html",{'m_data': m_data,'c_data':c_data})
    else:
        aut, msg = auth
        if msg == "wrongUser":
            return HttpResponse("You are not a valid user")
        elif msg == "notLogin":
            return HttpResponse("Please login to access this page")

def pres_search(request):
    if request.method == "POST":
        auth = authorization(request.session['authenticate'], request.session['role'], 4)
        if auth == True:
            get_dis_name = request.POST['search']
            try:
                d_data = Diseases.objects.filter(dis_name=get_dis_name)
                for i in d_data:
                    get_id = i.id
                dis_data = Diseases.objects.get(id = get_id)
                prec_data = Precautions.objects.filter(dis_id=get_id)
                sym_data = Symptoms.objects.filter(dis_id=get_id)
                med_data = Relation.objects.filter(dis_id=get_id)
                m_data = MedicineDetails.objects.all()
                c_data = MedicinesCategory.objects.all()
                return render(request, "prescription_detail.html", {'dis_data': dis_data,'prec_data':prec_data,'sym_data':sym_data,'m_data':m_data,'med_data':med_data,'c_data':c_data})
            except:
                return redirect("/home/")
        else:
            aut, msg = auth
            if msg == "wrongUser":
                return HttpResponse("You are not a valid user")
            elif msg == "notLogin":
                return HttpResponse("Please login to access this page")





