@cd /d %~dp0

@call do_init.bat

set ACTION=-------------- Translate Source Code --------------

if not exist "%SRC_TRANSLATE_WAIT%" (
    echo "%SRC_TRANSLATE_WAIT%" does not exist
    goto :gotoend
)

if not exist "%SRC_TRANSLATE_WORK%" (
    echo "%SRC_TRANSLATE_WORK%" does not exist
    goto :gotoend
)

echo %ACTION% 
echo Source directory is: %SRC_TRANSLATE_WAIT%
echo Destination directory is: %SRC_TRANSLATE_WORK%
echo Included file suffix are: %SRC_TRANSLATE_FILE_EXTS%

"%EXE_TRANSLATE%" -exts "%SRC_TRANSLATE_FILE_EXTS%" -indir "%SRC_TRANSLATE_WAIT%" -outdir "%SRC_TRANSLATE_WORK%" -opencc "%EXE_OPENCC%" -cccfg "%SRC_TRANSLATE_OPENCC_CFG_FILE%"

echo Finished

:gotoend
pause
