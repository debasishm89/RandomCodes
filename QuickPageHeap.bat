@ECHO OFF
ECHO PageHeap Enable / Diable Batch Script - Please run as admin
set /p Choice=Want to Enable, Disable or List PageHeap enabled programs? (e , d or l):%=%
SET GFLAG_PATH="C:\Program Files\Debugging Tools for Windows (x86)\gflags.exe"

if "%Choice%"=="e" goto :ENABLE
if "%Choice%"=="d" goto :DISABLE
if "%Choice%"=="l" goto :LISTPROGS

:ENABLE
	set /p procName=Enter Process Name(Ex. iexplorer.exe):%=%
	%GFLAG_PATH% /p /enable %procName%  /full
	%GFLAG_PATH% /i %procName% +hpa
	%GFLAG_PATH% /i %procName% +02000000
	goto :EOF
:DISABLE
	set /p procName=Enter Process Name(Ex. iexplorer.exe):%=%
	%GFLAG_PATH% /p /disable %procName%  /full
	%GFLAG_PATH% /i %procName% -hpa
	%GFLAG_PATH% /i %procName% -02000000
	goto :EOF
:LISTPROGS
	%GFLAG_PATH% /p
	goto :EOF
