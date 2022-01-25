 #@dev502

#Script to obtain account properties and save it into csv file
Import-Module ActiveDirectory

#Create a csv file with data and use it to search account porperties into the Active Directory, generally samAccountName is common to use
$path = 'path/to/your/csv/file';

#Save de data into an array variable
$members = Import-Csv $path -Header "samAccountNameHeader"

#Create an array to save te results
$admembers = @()


#Loop each data item saved into members and add it to admembers with se properties you like
foreach($member in $members){
  $admember = $member.CODIGO
  $admembers += Get-ADUser -Filter{Initials -eq $admember} -Properties * | Select Initials, EmailAddress,samAccountName
}

#Save the result into a csv to use
$admembers | Export-Csv -Path "path/to/save/csv/file/results" -NoTypeInformation

#Name the variables as you pleased 
