import csv
from pyad import *

def createuserfromcsv():
    #takes full file path
    file = input('please type your file path + file: ')
    data = open(file,encoding="utf-8")
    csv_data = csv.reader(data)
    data_lines = list(csv_data)
    #load admin information
    pyad.set_defaults(ldap_server="DC-01.l1-2.lab",username="Administrator",password="Aymar123-")

    for line in data_lines[1:]:
        user = line[0]
        oupath = line[2]
        ou = pyad.adcontainer.ADContainer.from_dn(oupath)
        pyad.aduser.ADUser.create(user,ou,password="abc-123")

createuserfromcsv()
