from email.mime.text import MIMEText
from email.mime.image import MIMEImage
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
import smtplib, ssl

# smtp = smtplib.SMTP('ssl0.ovh.net',587)
smtp = smtplib.SMTP('smtp.mail.ovh.net',465)
smtp.set_debuglevel(2)
smtp.ehlo()
# smtp.starttls()
smtp.login("ynovcampus", "ynovcampus")

subject = 'Bonsoir'
text = "Bonjour"
msg = MIMEMultipart()
my_address = "ynovcampus@claveblanca.com"
msg["From"] = my_address
msg["To"] = "sinaure@gmail.com"
msg['Subject'] = subject
msg.attach(MIMEText(text))

to = ["sinaure@gmail.com"]
smtp.sendmail(from_addr=my_address,
              to_addrs=to,
              msg=msg.as_string())
smtp.quit()