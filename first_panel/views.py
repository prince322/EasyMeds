from django.shortcuts import render, HttpResponse,redirect
from first_panel.forms import RoleDetailsForm
from first_panel.models import RoleDetails, UserRole
from django.contrib.auth.hashers import make_password,check_password
from miscFiles.genericFunction import generate_string,link_send,otp_generate,otp_send


def index(request):
    return render(request, "index.html")

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
    if request.method == "POST":
        get_email= request.POST['username']
        get_password = request.POST['password']
        try:
            data = RoleDetails.objects.get(email=get_email)
            user_password=data.password
            db_active = data.active
            db_verify_link = data.verify_link
            role = data.role_id
            if check_password(get_password, user_password):
                if db_active == "0" and db_verify_link!= "":
                    return HttpResponse("please do verify your email")
                elif db_active == "1":

                    request.session['email'] = get_email

                    request.session['name'] = data.name
                    if role == 1:
                        return render(request,"adminindex.html")
                    elif role == 2:
                        pass
            else:
                return HttpResponse("password not valid")
        except:
            return  HttpResponse("<h1>Email not valid</h1>")
    return render(request,"login.html")


def verify_link(request):
    get_link =request.GET['link']
    session_mail = request.session['email']
    data = RoleDetails.objects.get(email=session_mail)
    db_verify = data.verify_link
    if get_link == db_verify:
        update = RoleDetails(email=session_mail,active=1,verify_link="")
        update.save(update_fields=['active','verify_link'])
        return redirect("/update_password/")


def update_password(request):
    if request.method == "POST":
        user_password = request.POST['new_pass']
        con_password = request.POST['con_pass']
        session_mail = request.session['email']
        data = RoleDetails.objects.get(email=session_mail)
        db_password = data.password
        if user_password == con_password:
            update = RoleDetails(email=session_mail, password=make_password(con_password))
            update.save(update_fields=['password'])
            return redirect("/home/")
    return render(request, "updatePassword.html")


def forgot_password(request):
    if request.method == "POST":
        try:
            get_email = request.POST["email"]
            data=RoleDetails.objects.get(email=get_email)
            db_email = data.email
            db_active = data.active
            if db_active == "1":
                a=otp_generate()
                update = RoleDetails(email=get_email, otp = make_password(a))
                update.save(update_fields=['otp'])
                otp_send(str(a),db_email)
                request.session['email']=get_email
                return redirect("/reset/")
            else:
                return render(request, "forgotten_password.html", {'con':True})
        except:
            return render(request,"forgotten_password.html",{'confirm':True})
    return render(request,"forgotten_password.html")