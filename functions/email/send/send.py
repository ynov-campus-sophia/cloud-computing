import smtplib, ssl
from email.message import EmailMessage

smtp_server = "mail-ynovcampus.ddns.net"
port = 587  # For starttls
sender_email = "test2@ynovcampus.com"
password = "ynovpass"

# Create a secure SSL context
context = ssl.create_default_context()

# Try to log in to server and send email
try:
    server = smtplib.SMTP(smtp_server, 587)
    server.starttls(context=context) # Secure the connection
    server.set_debuglevel(2)
    server.ehlo() # Can be omitted
    server.login(sender_email, password)
    server.ehlo()
    description = "This is the test description supposed to be in body of the email."
    msg = EmailMessage()
    msg.set_content(description)
    server.sendmail(from_addr=sender_email,
              to_addrs="test2@ynovcampus.com",
              msg=msg.as_string())
except Exception as e:
    # Print any error messages to stdout
    print(e)
finally:
    server.quit() 