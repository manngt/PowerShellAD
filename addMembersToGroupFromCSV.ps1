 #Add Active Directory module
Import-Module ActiveDirectory

#Save to a variable the path of your csv containing samAccounts
$groupMembersFile = "path/to/your/csv/file";

#Save to a variable the group name
$group = "Group Name";

#Optional: remove all users from the group, uncomment the next line
#Get-ADGroupMember -identity $group | ForEach-Object {Remove-ADGroupMember $group $_ -Confirm:$false}

#Save the samAccounts to a variable
$members = Import-CSV $groupMembersFile -Header "samAccountName"

#Loop each samAccount and add it to the group
foreach( $member in $members){
 Get-ADUser $member.samAccountName | ForEach-Object {Add-ADGroupMember -Identity $group -Members $_}
} 
