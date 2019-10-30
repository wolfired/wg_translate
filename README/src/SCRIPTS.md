# 相关转换脚本

* 禁止在转换脚本里写中文

## 源代码转换脚本

* translate_txt.bat, 必填参数如下:

```bash

```

## 皮肤转换脚本

* translate_fla.bat


```bash
# -*-*-*-*-*-*-*-*-*-*-*-*-
set EXE_FLASH="C:\Program Files (x86)\Adobe\Adobe Flash CS6\Flash.exe"
# -*-*-*-*-*-*-*-*-*-*-*-*-
```

* 运行本脚本前, 请确认已经关闭Flash.exe
* 本脚本需要右键`以管理员身份运行`
* 运行参数如下:

## 图片转换脚本

* translate_img.bat, 必填参数如下

```bash
# -*-*-*-*-*-*-*-*-*-*-*-*-
set WAIT_PRE="E:\translate\example11.cdn.wait" # 目录, 前一版本的待转换资源
set WORK_PRE="E:\translate\example11.cdn.work" # 目录, 前一版本的已转换资源
set WAIT_CUR="E:\translate\example12.cdn.wait" # 目录, 当前版本的待转换资源
set WORK_CUR="E:\translate\example12.cdn.work" # 目录, 当前版本的已转换资源
# -*-*-*-*-*-*-*-*-*-*-*-*-
```
