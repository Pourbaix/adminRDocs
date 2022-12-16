# 4. Sur base d’un CSV dont vous définissez et documentez la structure, modifier
# automatiquement des informations sur des comptes utilisateur


Import-Module ActiveDirectory

$users = Import-Csv C:\path\to\users.csv

foreach ($user in $users) {
  $username = $user.Username
  $firstName = $user.FirstName
  $lastName = $user.LastName
  $title = $user.Title
  $department = $user.Department
  $company = $user.Company

  Set-ADUser -Identity $username `
             -GivenName $firstName `
             -Surname $lastName `
             -Title $title `
             -Department $department `
             -Company $company
}


# This script imports the ActiveDirectory module and then imports the CSV file. It loops through each row (representing a user) and modifies the user account using the Set-ADUser cmdlet, specifying the various attributes to be modified such as the first name, last name, title, department, and company.

# Username,FirstName,LastName,Title,Department,Company
# user1,John,Doe,Manager,IT,Acme Inc.
# user2,Jane,Doe,Developer,IT,Acme Inc.


# You can also modify the script to include additional attributes or change the default values for certain attributes, as needed. For example, to change the user's password, you can use the -AccountPassword parameter of the Set-ADUser cmdlet:


# Set-ADUser -Identity $username `
#            -AccountPassword (convertto-securestring $password -AsPlainText -Force)


# Note: The -AsPlainText parameter is used to specify that the password is in plain text, and the -Force parameter is used to suppress the confirmation prompt. Make sure to replace $password with the actual password you want to set for the user.