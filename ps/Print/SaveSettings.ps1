$list = $args[0]
$directory = $args[1]

$printersName=get-content $list
foreach ($item in $printersName)
{
	$Path=$directory+$item+".dat"
	rundll32 printui.dll,PrintUIEntry /Ss /n $item /a $Path 2
}

