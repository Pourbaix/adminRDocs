# 3. Débloquer facilement le compte d’un utilisateur ayant dépassé le nombre de
# tentatives de login erroné


Import-Module ActiveDirectory

$users = Import-Csv C:\path\to\users.csv

foreach ($user in $users) {
  $username = $user.Username
  Unlock-ADAccount -Identity $username
}


# This script imports the ActiveDirectory module and then imports the CSV file. It loops through each row (representing a user) and uses the Unlock-ADAccount cmdlet to unlock the user account with the specified username.

# Username
# user1
# user2