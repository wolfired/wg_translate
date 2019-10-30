@cd /d %~dp0

@call do_init.bat

set ACTION=-------------- Transline Fla's Texts --------------

if not exist "%FLA_TXT_TRANSLINE_WAIT%" (
    echo "%FLA_TXT_TRANSLINE_WAIT%" does not exist
    goto :gotoend
)

if not exist "%FLA_TXT_TRANSLINE_WORK%" (
    echo "%FLA_TXT_TRANSLINE_WORK%" does not exist
    goto :gotoend
)

echo %ACTION% 
echo Source directory is: %FLA_TXT_TRANSLINE_WAIT%
echo Destination directory is: %FLA_TXT_TRANSLINE_WORK%
echo Included file suffix are: %FLA_TXT_TRANSLINE_FILE_EXTS%

"%EXE_TRANSLINE%" -exts "%FLA_TXT_TRANSLINE_FILE_EXTS%" -indir "%FLA_TXT_TRANSLINE_WAIT%" -outdir "%FLA_TXT_TRANSLINE_WORK%" -opencc "%EXE_OPENCC%" -cccfg "%FLA_TXT_TRANSLINE_OPENCC_CFG_FILE%"

echo Finished

:gotoend
pause
