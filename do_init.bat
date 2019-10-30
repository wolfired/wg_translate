@echo off

rem -*-*-*-*-*-*-*-*-*-*-*-*-
set DIR_VERSION_PRE=E:\translate\example11
set DIR_VERSION_CUR=E:\translate\example12
rem -*-*-*-*-*-*-*-*-*-*-*-*-

rem -*-*-*-*-*-*-*-*-*-*-*-*-
rem do_fla_export_img_txt.bat
rem do_fla_import_img_txt.bat
rem do_fla_export_swf_swc.bat
set EXE_FLASH=C:\Program Files (x86)\Adobe\Adobe Flash CS6\Flash.exe
set EXPORT_TARGETS_IMG_OR_TXT=;
set EXPORT_ACTIONS_IMG_OR_TXT=export.img;export.txt
set IMPORT_TARGETS_IMG_OR_TXT=;
set IMPORT_ACTIONS_IMG_OR_TXT=import.img;import.txt
set EXPORT_TARGETS_SWF_OR_SWC=;
set EXPORT_ACTIONS_SWF_OR_SWC=export.swf
rem -*-*-*-*-*-*-*-*-*-*-*-*-

rem -*-*-*-*-*-*-*-*-*-*-*-*-
rem do_fla_txt_transline.bat
set FLA_TXT_TRANSLINE_FILE_EXTS=.txt
set FLA_TXT_TRANSLINE_OPENCC_CFG_FILE=.\opencc\share\opencc\s2tw.json
set FLA_TXT_TRANSLINE_WAIT=%DIR_VERSION_CUR%\fla.work
set FLA_TXT_TRANSLINE_WORK=%DIR_VERSION_CUR%\fla.work
rem -*-*-*-*-*-*-*-*-*-*-*-*-

rem -*-*-*-*-*-*-*-*-*-*-*-*-
rem do_fla_img_merge.bat
set FLA_IMG_MERGE_FILE_EXTS=.jpg .png
set FLA_IMG_MERGE_WAIT_PRE=%DIR_VERSION_PRE%\fla.work\img.wait
set FLA_IMG_MERGE_WORK_PRE=%DIR_VERSION_PRE%\fla.work\img.work
set FLA_IMG_MERGE_WAIT_CUR=%DIR_VERSION_CUR%\fla.work\img.wait
set FLA_IMG_MERGE_WORK_CUR=%DIR_VERSION_CUR%\fla.work\img.work
rem -*-*-*-*-*-*-*-*-*-*-*-*-

rem -*-*-*-*-*-*-*-*-*-*-*-*-
rem do_src_translate.bat
set SRC_TRANSLATE_FILE_EXTS=.as
set SRC_TRANSLATE_OPENCC_CFG_FILE=.\opencc\share\opencc\s2tw.json
set SRC_TRANSLATE_WAIT=%DIR_VERSION_CUR%\src.work
set SRC_TRANSLATE_WORK=%DIR_VERSION_CUR%\src.work
rem -*-*-*-*-*-*-*-*-*-*-*-*-

rem -*-*-*-*-*-*-*-*-*-*-*-*-
rem do_cdn_img_merge.bat
set CDN_IMG_MERGE_FILE_EXTS=.jpg .png
set CDN_IMG_MERGE_WAIT_PRE=%DIR_VERSION_PRE%\cdn.wait
set CDN_IMG_MERGE_WORK_PRE=%DIR_VERSION_PRE%\cdn.work
set CDN_IMG_MERGE_WAIT_CUR=%DIR_VERSION_CUR%\cdn.wait
set CDN_IMG_MERGE_WORK_CUR=%DIR_VERSION_CUR%\cdn.work
rem -*-*-*-*-*-*-*-*-*-*-*-*-

rem -*-*-*-*-*-*-*-*-*-*-*-*-
rem do_cdn_txt_translate.bat
set CDN_TXT_TRANSLATE_FILE_EXTS=.as .xml
set CDN_TXT_TRANSLATE_OPENCC_CFG_FILE=.\opencc\share\opencc\s2tw.json
set CDN_TXT_TRANSLATE_WAIT=%DIR_VERSION_CUR%\cdn.wait
set CDN_TXT_TRANSLATE_WORK=%DIR_VERSION_CUR%\cdn.work
rem -*-*-*-*-*-*-*-*-*-*-*-*-

rem -*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-

rem -*-*-*-*-*-*-*-*-*-*-*-*-
set EXE_MERGE=.\merge.exe
set EXE_TRANSLATE=.\translate.exe
set EXE_TRANSLINE=.\transline.exe
set EXE_OPENCC=.\opencc\bin\opencc.exe
rem -*-*-*-*-*-*-*-*-*-*-*-*-
