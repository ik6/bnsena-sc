import os
import smtplib
os.system('clear')
print ('''\033[1;91m
 ____  _   _ ____  _____ _   _    _      ____   ____ 
| __ )| \ | / ___|| ____| \ | |  / \    / ___| / ___|
|  _ \|  \| \___ \|  _| |  \| | / _ \   \___ \| |    
| |_) | |\  |___) | |___| |\  |/ ___ \   ___) | |___ 
|____/|_| \_|____/|_____|_| \_/_/   \_\ |____/ \____|
\033[1;m\033[1;32mThis Script Programing By BNSENA  \033[1;m''')
print("-------------------------------------------------------")
print  ("\033[1;36mBruteForce Email [Outlook SMTP ONLY]  [1]")
print  ("\033[1;36mSkip Windows Defender Protection Payload [2]")
print ("\033[1;36mDos Attack [3]\033[1;m")
choose = input('Choose:')

if choose == "1" :	
 os.system('clear')
 print ('''\033[1;91m
 ____  _   _ ____  _____ _   _    _      ____   ____ 
 | __ )| \ | / ___|| ____| \ | |  / \    / ___| / ___|
 |  _ \|  \| \___ \|  _| |  \| | / _ \   \___ \| |    
 | |_) | |\  |___) | |___| |\  |/ ___ \   ___) | |___ 
 |____/|_| \_|____/|_____|_| \_/_/   \_\ |____/ \____| 
\033[1;m\033[1;32mThis Script Programing By BNSENA  \033[1;m''')
 os.system('python 1.py')
if choose == "2" :
  os.system('clear')
  os.system('./1.sh')

if choose == "3":
 os.system('clear')
 print ('''\033[1;91m
 ____  _   _ ____  _____ _   _    _      ____   ____ 
 | __ )| \ | / ___|| ____| \ | |  / \    / ___| / ___|
 |  _ \|  \| \___ \|  _| |  \| | / _ \   \___ \| |    
 | |_) | |\  |___) | |___| |\  |/ ___ \   ___) | |___ 
 |____/|_| \_|____/|_____|_| \_/_/   \_\ |____/ \____| 
 \033[1;m\033[1;32mThis Script Editing By BNSENA  \033[1;m''')
 host = input("Enter The Target Host: ")
 os.system('perl 1.perl -dns ' + host)
