import csv
from active_directory import update_user

# Ouvre le fichier CSV en mode lecture
with open("users.csv", "r") as csv_file:
    # Lit les données du fichier CSV en utilisant le module CSV
    csv_reader = csv.reader(csv_file)
    # Parcoure les lignes du fichier CSV
    for row in csv_reader:
        # Récupère les données du fichier CSV
        username = row[0]
        password = row[1]
        first_name = row[2]
        last_name = row[3]
        email = row[4]
        # Met à jour les informations du compte utilisateur dans Active Directory en utilisant l'API Active Directory
        update_user(username, password, first_name, last_name, email)