# google 앱 비밀번호 : ohqy zuti xuyc osov
import smtplib
import ssl
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

def send_email(email, content):
    port = 587
    smtp_server = "smtp.gmail.com"
    sender_email = "kanghyundo@gmail.com"
    receiver_email = email
    password = "ohqy zuti xuyc osov"
    message = f"<h1>{content}</h1>"

    msg = MIMEText(message, 'html')
    data = MIMEMultipart()
    data.attach(msg)

    context = ssl.create_default_context()
    with smtplib.SMTP(smtp_server, port) as server:
        server.ehlo()
        server.starttls(context=context)
        server.ehlo()
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, data.as_string())

