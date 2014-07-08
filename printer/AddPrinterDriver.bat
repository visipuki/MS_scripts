rem add printer driver on remote PC b7jgw2j
rundll32 printui.dll,PrintUIEntry /ia /c\\b7jgw2j /m "Xerox Global Print Driver PS" /h "x86" /v "Type 3 - User Mode" /f \\L70071821\Distributives\Xerox\X-GPD_PS_32Driver\x2UNIVP.inf /q

rem add printer on remote PC
rundll32 printui.dll,PrintUIEntry /if /b "Test Printer" /r "SafeQ001" /m "Xerox Global Print Driver PS" /c\\b7jgw2j /q