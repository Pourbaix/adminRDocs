# 1. Sur base d’un CSV dont vous définissez et documentez la structure, créer
# automatiquement des comptes utilisateurs Active Directory

Import-Module ActiveDirectory

$users = Import-Csv C:\path\to\users.csv

foreach ($user in $users) {
  $username = $user.Username
  $password = $user.Password
  $firstName = $user.FirstName
  $lastName = $user.LastName
  $ou = $user.OU

  $userPrincipalName = "$username@domain.com"
  $name = "$firstName $lastName"

  New-ADUser -Name $name `
             -SamAccountName $username `
             -UserPrincipalName $userPrincipalName `
             -GivenName $firstName `
             -Surname $lastName `
             -Enabled $true `
             -PasswordNeverExpires $true `
             -ChangePasswordAtLogon $false `
             -Path $ou `
             -AccountPassword (convertto-securestring $password -AsPlainText -Force)
}

# Ce script suppose que le fichier CSV a le format suivant :

# Username,Password,FirstName,LastName,OU
# user1,Pa$$w0rd,John,Doe,OU=Users,DC=domain,DC=com
# user2,Pa$$w0rd,Jane,Doe,OU=Users,DC=domain,DC=com


# The script imports the ActiveDirectory module, which contains cmdlets for managing Active Directory objects. It then imports the CSV file and loops through each row (representing a user). For each user, it creates a new Active Directory user account using the New-ADUser cmdlet, specifying the various attributes of the user such as the name, username, password, and organizational unit (OU) in which the user will be created.

# Note: Make sure to replace domain.com with your actual domain name, and C:\path\to\users.csv with the actual path to your CSV file. You may also want to modify the script to include additional attributes or change the default values for certain attributes, as needed.