@ECHO off
IF [%1]==[] GOTO :ERROR
ping -n 1 -w 100 %1.1 1>nul
IF NOT %ERRORLEVEL% == 0 GOTO :ERROR 

IF %1 GEQ 0 (
	FOR /L %%i IN (1,1,255) DO snmpget -v2c -t 0.1 -c public -Ovq %1.%%i 1.3.6.1.2.1.25.3.2.1.3.1 2<&1 | findstr /v "^Timeout" && echo %1.%%i
	GOTO :EOF
) ELSE GOTO :ERROR
ELSE GOTO :EOF
:ERROR
ECHO "use %~n0 subnet_address(192.168.0 - example)"
