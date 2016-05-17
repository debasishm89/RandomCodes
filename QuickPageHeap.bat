@ECHO OFF

SET GFLAG_PATH="C:\Program Files\Debugging Tools for Windows (x86)\gflags.exe"

IF EXIST %GFLAG_PATH% (
	ECHO Full PageHeap Enable / Disable Batch Script - Please run as admin
) ELSE (
	ECHO Path of %GFLAG_PATH% doesnt exist. Please set correct path. 
	goto :EOF
)

set /p Choice=Want to Enable,Disable or List PageHeap enabled programs? (e or d or l):%=%

if "%Choice%"=="e" goto :ENABLE
if "%Choice%"=="d" goto :DISABLE
if "%Choice%"=="l" goto :LISTPROGS

:ENABLE
	set /p procName=Enter Process Name(Ex. iexplore.exe):%=%
	%GFLAG_PATH% /p /enable %procName%  /full
	%GFLAG_PATH% /i %procName% +hpa
	%GFLAG_PATH% /i %procName% +02000000
	goto :EOF
:DISABLE
	set /p procName=Enter Process Name(Ex. iexplore.exe):%=%
	%GFLAG_PATH% /p /disable %procName%  /full
	%GFLAG_PATH% /i %procName% -hpa
	%GFLAG_PATH% /i %procName% -02000000
	goto :EOF
:LISTPROGS
	%GFLAG_PATH% /p
	goto :EOF
