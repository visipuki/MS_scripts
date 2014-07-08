cscript //nologo %WINDIR%\System32\Printing_Admin_Scripts\en-US\prnport.vbs -a -s %COMPUTERNAME% -r test3 -h 13.213.19.161 -o RAW -n 9100 -me -i 1 -y test_public 
cscript //nologo %WINDIR%\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs -a -s %COMPUTERNAME% -p "gpd pcl6 test" -m "Xerox GPD PCL6 V3.2.303.16.0" -r "test3" 
cscript //nologo %WINDIR%\System32\Printing_Admin_Scripts\en-US\prncnfg.vbs -t -s %COMPUTERNAME% -p "gpd pcl6 test" -h "gpd pcl6 test" +shared 
pause