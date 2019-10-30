@cd /d %~dp0

@call do_init.bat

set ACTION=-------------- Merge Fla's Images --------------

if not exist "%DIR_VERSION_PRE%" (
    echo The option DIR_VERSION_PRE in do_init.bat is not set
    goto :gotoend
)

echo %ACTION%
echo Source directory is: %FLA_IMG_MERGE_WORK_PRE%
echo Destination directory is: %FLA_IMG_MERGE_WORK_CUR%
echo Included file suffix are: %FLA_IMG_MERGE_FILE_EXTS%

"%EXE_MERGE%" -exts "%FLA_IMG_MERGE_FILE_EXTS%" -prewait "%FLA_IMG_MERGE_WAIT_PRE%" -prework "%FLA_IMG_MERGE_WORK_PRE%" -curwait "%FLA_IMG_MERGE_WAIT_CUR%" -curwork "%FLA_IMG_MERGE_WORK_CUR%"

echo Finished

:gotoend
pause
