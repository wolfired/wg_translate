@cd /d %~dp0

@call do_init.bat

set ACTION=-------------- Merge Images in CDN --------------

if not exist "%DIR_VERSION_PRE%" (
    echo The option DIR_VERSION_PRE in do_init.bat is not set
    goto :gotoend
)

echo %ACTION%
echo Source directory is: %CDN_IMG_MERGE_WORK_PRE%
echo Destination directory is: %CDN_IMG_MERGE_WORK_CUR%
echo Included file suffix are: %CDN_IMG_MERGE_FILE_EXTS%

"%EXE_MERGE%" -exts "%CDN_IMG_MERGE_FILE_EXTS%" -prewait "%CDN_IMG_MERGE_WAIT_PRE%" -prework "%CDN_IMG_MERGE_WORK_PRE%" -curwait "%CDN_IMG_MERGE_WAIT_CUR%" -curwork "%CDN_IMG_MERGE_WORK_CUR%"

echo Finished

:gotoend
pause
