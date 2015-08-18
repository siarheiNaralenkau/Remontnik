# -*- coding: utf-8 -*-

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from django.conf import settings

def send_confirm_registration(recipient_mail, recipient_id):
  msg = MIMEMultipart("alternative")
  msg["Subject"] = u"Подтверждение регистрации"
  msg["From"] = settings.MAIL_FROM
  msg["To"] = recipient_mail

  confirm_link = "http://{0}:8000/remont/confirm_registration?user_id={1}".format(settings.HOST_NAME, recipient_id)

  text = u"Для завршения регистрации на staatix.com пройдите по ссылке:{0}".format(confirm_link)
  html = u"""
  <html>
  <head></head>
  <body>
  <p>Для завершения регистрации на staatix.com, пройдите по ссылке:</p>
  <a href={0}>{1}</a>
  </body>
  </html>
  """.format(confirm_link, confirm_link)

  part1 = MIMEText(text.encode('utf-8'), 'plain', 'utf-8')
  part2 = MIMEText(html.encode('utf-8'), 'html', 'utf-8')

  msg.attach(part1)
  msg.attach(part2)

  mail_sender = smtplib.SMTP(settings.SMTP_SERVER, settings.SMTP_PORT)
  mail_sender.ehlo()
  mail_sender.starttls()
  mail_sender.ehlo()
  mail_sender.login(settings.MAIL_FROM, settings.MAIL_PASSWORD)
  mail_sender.sendmail(settings.MAIL_FROM, recipient_mail, msg.as_string())
  mail_sender.quit()
