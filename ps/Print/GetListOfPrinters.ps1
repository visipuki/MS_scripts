#Geting list of local printers and save their name in the list
#input path to the file as the first argument
#and word for matching name of printers by regular expression
$mm=$args[1]
$printers=gwmi win32_printer -Filter "Local='$true'" | ? {$_.name -match $mm}

foreach ($printer in $printers)
{
	write-host $($printer.name)
	add-content -path $args[0] -value $printer.name
}

Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
