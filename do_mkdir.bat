@cd /d %~dp0

@call do_init.bat

set ACTION=-------------- Make Directories --------------

if not exist "%DIR_VERSION_CUR%" (
    mkdir "%DIR_VERSION_CUR%\cdn.wait"
    echo new %DIR_VERSION_CUR%\cdn.wait directory

    mkdir "%DIR_VERSION_CUR%\cdn.work"
    echo new %DIR_VERSION_CUR%\cdn.work directory

    mkdir "%DIR_VERSION_CUR%\fla.wait"
    echo new %DIR_VERSION_CUR%\fla.wait directory

    mkdir "%DIR_VERSION_CUR%\fla.work"
    echo new %DIR_VERSION_CUR%\fla.work directory

    mkdir "%DIR_VERSION_CUR%\src.work"
    echo new %DIR_VERSION_CUR%\src.work directory
) else (
    echo %DIR_VERSION_CUR% is exist, do nothing
)

:eof
pause
