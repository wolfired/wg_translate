@cd /d %~dp0

@call do_init.bat

set ACTION=-------------- Translate Texts in CDN --------------

if not exist "%CDN_TXT_TRANSLATE_WAIT%" (
    echo "%CDN_TXT_TRANSLATE_WAIT%" does not exist
    goto :gotoend
)

if not exist "%CDN_TXT_TRANSLATE_WORK%" (
    echo "%CDN_TXT_TRANSLATE_WORK%" does not exist
    goto :gotoend
)

echo %ACTION% 
echo Source directory is: %CDN_TXT_TRANSLATE_WAIT%
echo Destination directory is: %CDN_TXT_TRANSLATE_WORK%
echo Included file suffix are: %CDN_TXT_TRANSLATE_FILE_EXTS%

"%EXE_TRANSLATE%" -exts "%CDN_TXT_TRANSLATE_FILE_EXTS%" -indir "%CDN_TXT_TRANSLATE_WAIT%" -outdir "%CDN_TXT_TRANSLATE_WORK%" -opencc "%EXE_OPENCC%" -cccfg "%CDN_TXT_TRANSLATE_OPENCC_CFG_FILE%"

echo Finished

:gotoend
pause
