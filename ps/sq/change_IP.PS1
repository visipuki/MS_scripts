$f1 = 'C:\SafeQ5\conf\startup.conf'
$f2 = 'C:\SafeQ5\terminalserver\TerminalServer.exe.config'
$f3 = 'C:\SafeQ5\tomcat\conf\server.xml'
$Eth = Get-NetIPAddress | ?{$_.InterfaceAlias -eq "Ethernet"} | ?{$_.AddressFamily -eq "IPv4"}
$ip_new = $Eth.IPAddress
write "New IP is $ip_new"
$ip_old = ((Select-String server-ip $f1).line -split '\s*=\s*')[1]
write "IP in SQ_DIR\startup.conf is $ip_old"

if ($ip_new -eq '' -or $ip_old -eq '') {
    write 'IP address is null. Exit..'
    Exit
    }

if ($ip_new -eq $ip_old) {
	write "ip is not changed. Exit..."
    Exit
    }

Get-Service | ?{$_.name -match "^YSoft"} | Stop-Service

$files = $f1, $f2, $f3
foreach ($f in $files) {
    write "Changing $f"
    $content = gc $f | %{$_ -replace $ip_old, $ip_new}
    $content = gc $f | ?{$_ -match $ip_new} | write
    sc $f $content}

sqlcmd -d SQDB5 -Q "update cluster_server set ip_address = '$ip_new where ip_address = '$ip_old'"

Get-Service | ?{$_.name -match "^YSoft"} | Start-Service