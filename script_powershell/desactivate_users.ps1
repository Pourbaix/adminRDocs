# 2. Sur base d’un CSV dont vous définissez et documentez la structure, désactiver automatiquement des comptes utilisateurs AD


Import-Module ActiveDirectory

$users = Import-Csv C:\path\to\users.csv

foreach ($user in $users) {
  $username = $user.Username
  Disable-ADAccount -Identity $username
}


# This script imports the ActiveDirectory module and then imports the CSV file. It loops through each row (representing a user) and disables the user account using the Disable-ADAccount cmdlet, specifying the username of the user account to be disabled.

# Username
# user1
# user2

