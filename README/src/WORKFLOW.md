### 操作流程

> 文件夹, 文件名一律不得有中文
> 
> 执行任何操作前, 确保 `Flash.exe` 处在关闭状态

1. 修改 `do_init.bat`

```bash
# 指向前一版本的翻译目录, 如果当次是第一次进行翻译工作则留空
set DIR_VERSION_PRE=
# 指向当前版本的翻译目录, 如果这个目录已经存在请先删除
set DIR_VERSION_CUR=E:\translate\version5800
# 指向你电脑上的Flash.exe所在路径
set EXE_FLASH=C:\Program Files (x86)\Adobe\Adobe Flash CS6\Flash.exe
```

2. 运行 `do_mkdir.bat` 生成翻译目录

3. 找前端拿到全部 `*.fla` 皮肤文件放到 `E:\translate\version5800\fla.wait` 下, 确认皮肤文件可读写

4. 运行 `do_fla_export_img_txt` 输出皮肤里的图片与文本到 `E:\translate\version5800\fla.work` 下

    * 如果这是第一次进行翻译则跳过这步: 运行 `do_fla_img_merge.bat` 把前一个版本的已翻译资源合并到当前版本
    * 原始图片在 `E:\translate\version5800\fla.work\img.wait` 下
    * 人工检查原始图片里需要处理的图片, 复制到 `E:\translate\version5800\fla.work\img.work` 对应的子目录下, 全部检查完毕后打包 `E:\translate\version5800\fla.work\img.work` 并交给美术处理, 处理后的图片大小一定要与原图一样
    * 拿到处理后的图片后放回到 `E:\translate\version5800\fla.work\img.work` 下

5. 运行 `do_fla_txt_transline.bat` 处理皮肤里的文本

6. 管理员权限运行 `do_fla_import_img_txt.bat` 更新皮肤

7. 运行 `do_fla_export_swf_swc.bat` 在 `E:\translate\version5800\fla.wait` 目录生成 `*.swc` 和 `*.swf`, 其中 `*.swc` 交给前端, `*.swf` 放到 `CDN` 上的 `res/ui` 下

8. 把 `CND` 上的 `res` 目录下的全部内容放到 `E:\translate\version5800\cdn.wait` 下

9. 运行 `do_cdn_img_merge.bat` 把前一个版本的已翻译资源合并到当前版本, 如果这是第一次进行翻译则跳过这步

10. 人工检查原始图片里需要处理的图片, 复制到 `E:\translate\version5800\cdn.work` 对应的子目录下, 全部检查完毕后打包 `E:\translate\version5800\cdn.work` 并交给美术处理, 处理后的图片大小一定要与原图一样

11. 运行 `do_cdn_txt_translate.bat` 处理 资源里的 `xml` 与 `as` 文件

12. 把前端项目源码放到 `E:\translate\version5800\src.work` 目录下, 运行 `do_src_translate.bat` 处理完毕后放回前端项目目录下的 `src` 子目录 

13. 把策划发过来的 `*.swc` 文件放到前端项目目录下的 `swc` 子目录

14. 重新编译前端项目
