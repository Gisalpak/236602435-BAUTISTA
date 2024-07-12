@echo off

set source=C:\*.txt
set destination=Z:\ArchivedFiles
if not exist %destination% mkdir %destination%


forfiles /p C:\ /m *.txt /d -30 /c "cmd /c move @file %destination%"
echo Sorting archived files by size:
for /f "tokens=*" %%a in ('dir %destination% /s /b /o-s *.txt') do echo %%a

echo Do you want to delete the old, large files? (y/n)
set /p choice=
if /i "%choice%"=="y" (
    del /q %destination%\*.txt
    echo Files deleted.
) else (
    echo Files not deleted.
)

pause