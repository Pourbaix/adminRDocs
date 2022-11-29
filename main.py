import csv
import os
from pyad import *
from dotenv import load_dotenv
load_dotenv()  # take environment variables from .env.

def createuserfromcsv():
    #takes full file path
    file = input('please type your file path + file: ')
    data = open(file,encoding="utf-8")
    csv_data = csv.reader(data)
    data_lines = list(csv_data)
    #load admin information
    pyad.set_defaults(ldap_server="DC-01.l1-2.lab", username= os.getenv('USERNAME'), password= os.getenv('PASSWORD'))

    for line in data_lines[1:]:
        user = line[0]
        oupath = line[2]
        ou = pyad.adcontainer.ADContainer.from_dn(oupath)
        pyad.aduser.ADUser.create(user,ou,password="abc-123")

createuserfromcsv()
