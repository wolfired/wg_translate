# 目录结构

```bash
.
│  translate_txt.bat                    # 文本转换脚本
│  translate_fla.bat                    # 皮肤转换脚本
│  translate_img.bat                    # 图片转换脚本
│
├─example11.src.wait                    # 目录, 放置待转换源代码
├─example11.src.work                    # 目录, 放置已转换源代码
├─example11.cdn.wait                    # 目录, 放置待转换CDN图片资源
├─example11.cdn.work                    # 目录, 放置已转换CDN图片资源
├─example11.fla.wait                    # 目录, 放置待转换皮肤
│      one.fla
└─example11.fla.work                    # 目录, 放置已转换皮肤相关资源
    │  one.fla.dst.txt                  # 文本, 记录已转换文本
    │  one.fla.src.txt                  # 文本, 记录待转换文本
    │
    ├─one.fla.dst.img                   # 目录, 记录待转换图片资源
    └─one.fla.src.img                   # 目录, 记录已转换图片资源
```
