@cd /d %~dp0

@call do_init.bat

set ACTION=-------------- Import Images and Texts to Fla --------------

if not exist "%EXE_FLASH%" (
    echo "%EXE_FLASH%" does not exist
    goto :gotoend
)

rem ***
echo version_dir=%DIR_VERSION_CUR%> translate.jsfl.ini
echo targets=%IMPORT_TARGETS_IMG_OR_TXT%>> translate.jsfl.ini
echo actions=%IMPORT_ACTIONS_IMG_OR_TXT%>> translate.jsfl.ini
rem ***

echo %ACTION%
echo Source directory is: %DIR_VERSION_CUR%.fla.work
echo Destination directory is: %DIR_VERSION_CUR%.fla.wait

if ";"== "%IMPORT_TARGETS_IMG_OR_TXT%" (
    echo Included file are: all fla
) else (
    echo Included file are: %IMPORT_TARGETS_IMG_OR_TXT%
)

echo Actions are: %IMPORT_ACTIONS_IMG_OR_TXT%

"%EXE_FLASH%" ".\translate.jsfl"

echo Finished

:gotoend
pause
