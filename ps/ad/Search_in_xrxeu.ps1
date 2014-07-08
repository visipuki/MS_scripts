$sAMAccountName = Read-Host "login = "
$givenName = Read-Host "name = "
$sn = Read-Host "surname = "
$department= Read-Host "department = "
$otherTelephone = Read-Host "extension = "

if ( $sAMAccountName -eq "" ) { $sAMAccountName = "*" }
# else {  $sAMAccountName = "*$sAMAccountName*" }
if ( $givenName -eq "" ) { $givenName = "*" }
# else {  $givenName = "*$givenName*" }
if ( $sn -eq "" ) { $sn = "*" }
# else {  $sn = "*$sn*" }
if ( $department -eq "" ) { $department = "*" }
# else {  $department = "*$department*" }
if ( $otherTelephone -eq "" ) { $otherTelephone = "*" }
# else {  $otherTelephone = "*$otherTelephone*" }

$strFilter = "(&(objectCategory=User)(sAMAccountName=$sAMAccountName)(givenName=$givenName)(sn=$sn)(department=$department)(otherTelephone=$otherTelephone))"
$objOU = New-Object System.DirectoryServices.DirectoryEntry("LDAP://OU=Users,OU=RUS,dc=eu,dc=xerox,dc=net")
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.SearchRoot = $objOU
$objSearcher.PageSize = 1000
$objSearcher.Filter = $strFilter
$objSearcher.SearchScope = "Subtree"
$colResults = $objSearcher.FindAll()
$i = 0
foreach ($person in $colResults)
	{
	$user=$person.GetDirectoryEntry()
	$i++
    Write-host "--------------------------------"
    Write-host $i
    Write-host "User: $($user.samaccountname)"
	Write-host "Name: $($user.givenname) $($user.sn)"
	Write-host "Title: $($user.title)"
    Write-host "Department: $($user.department)"
    Write-host "Extension: $($user.otherTelephone)"
	Write-host "--------------------------------"
    }
"Total $i"

Read-Host "enter anything for exit"