#!/bin/bash
echo " ————————————————————————————————————————————————————"
echo " "
echo " "

# 询问用户要清理超过多少天的文件
echo -n " - 请输入要清理超过多少天的文件（例如：60）："
read days
echo " "
echo " "
# 清理微信超过指定天数的文件
echo " ————————————————————————————————————————————————————"
echo " "
echo -n " - 是否清理微信超过${days}天的文件？(y/n): "
read input1
if [ "$input1" = "y" ]; then
    echo " "
    echo " - 正在清理中，这可不是一般的慢..."
    find /data/data/com.tencent.mm/MicroMsg -type d -name "attachment" -exec find {} -type f -mtime +$days -delete ';'
    echo " "
    echo " - 清理微信过期文件完成"
    echo " "
    echo " "
    echo " ————————————————————————————————————————————————————"
    echo " "
    echo " "
fi

# 清理微信超过指定天数的视频和图片
echo -n " - 是否清理微信超过${days}天的视频和图片？(y/n): "
read input1
if [ "$input1" = "y" ]; then
    echo " "
    echo " - 正在清理中，请耐心等待..."
    find /data/data/com.tencent.mm/MicroMsg \( -type d -name "image2" -o -name "video" -o -name "voice2" \) -exec find {} -type f -mtime +$days -delete ';'
    echo " "
    echo " - 清理微信过期视频和图片完成"
    echo " "
    echo " "
    echo " ————————————————————————————————————————————————————"
    echo " "
    echo " "
fi

# 清理QQ超过指定天数的文件
echo -n " - 是否清理QQ超过${days}天的文件？(y/n): "
read input1
if [ "$input1" = "y" ]; then
    echo " "
    echo " - 正在清理中，请耐心等待..."
    find /data/media/0/Android/data/com.tencent.mobileqq/Tencent/ -type d -name "QQfile_recv" -exec find {} -type f -mtime +$days -delete \;
    echo " "
    echo " - 清理QQ过期文件完成"
    echo " "
    echo " "
    echo " ————————————————————————————————————————————————————"
    echo " "
    echo " "
fi
