import random
import string
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
def generate_string(length=10):
    letter = string.ascii_letters
    pattern = "".join(random.choice(letter) for i in range(length))
    return pattern

def link_send(email,link):
    msg = MIMEMultipart()  # assign a variable to the multipart class

    msg['From'] = 'easymeds123@gmail.com'
    msg['To'] = email
    msg['Subject'] = "easymeds"
    body = "your verify link is  "+link
    msg.attach(MIMEText(body, "plain"))

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login('easymeds123@gmail.com', 'p1701284k')
    text = msg.as_string()
    server.sendmail('easymeds123@gmail.com', email, text)
    server.quit()
    print("Email Sent Successfully")
def otp_generate():
    otp=random.randint(100000,1000000)
    return otp
def otp_send(otp,email):
    msg = MIMEMultipart()  # assign a variable to the multipart class

    msg['From'] = 'easymeds123@gmail.com'
    msg['To'] = email
    msg['Subject'] = "easymeds"
    body = "your otp is "+otp
    msg.attach(MIMEText(body, "plain"))

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login('easymeds123@gmail.com', 'p1701284k')
    text = msg.as_string()
    server.sendmail('easymeds123@gmail.com', email, text)
    server.quit()
    print("Email Sent Successfully")
