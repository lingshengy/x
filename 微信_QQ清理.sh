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
    else
echo " "
    echo " - 操作已取消。"
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
    find /data/data/com.tencent.mm/MicroMsg /data/media/0/Android/data/com.tencent.mm/MicroMsg \( -type d -name "image2" -o -name "video" -o -name "voice2" -o -name "image" \) -exec find {} -type f -mtime +$days -delete ';'
    echo " "
    echo " - 清理微信过期视频和图片完成"
    else
echo " "
    echo " - 操作已取消。"
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
    else
echo " "
    echo " - 操作已取消。"
    echo " "
    echo " "
    echo " ————————————————————————————————————————————————————"
    echo " "
    echo " "
fi

# 清理QQ聊天图片超过指定天数的文件
echo -n " - 是否清理QQ聊天记录超过${days}天的【视频 | 图片 | 表情包】？(y/n): "
read input1
if [ "$input1" = "y" ]; then
    echo " "
    echo " - 正在清理中，请耐心等待..."
    find /data/media/0/Android/data/com.tencent.mobileqq/Tencent/MobileQQ \( -type d -name "thumbs" -o -name "chatpic" -o -name "thumb" \) -exec find {} -type f -mtime +$days -delete ';'
    echo " "
    echo " - 清理QQ聊天图片过期文件完成"
    else
echo " "
    echo " - 操作已取消。"
    echo " "
    echo " "
    echo " ————————————————————————————————————————————————————"
    echo " "
    echo " "
fi

echo " ➣ 此操作可能会导致微信和QQ掉登录，但不会删除聊天记录"
echo " - 是否重建微信 and QQ缓存？【实验性功能】(y/n): "
# 读取用户输入
read answer

if [[ "$answer" == "y" ]]; then
    # 定义要搜索的目录
    directories=(
        "/data/data/com.tencent.mm/"
        "/data/media/0/Android/data/com.tencent.mm/"
        "/data/data/com.tencent.mobileqq/"
        "/data/media/0/Android/data/com.tencent.mobileqq/"
    )

    # 遍历每个目录
    for dir in "${directories[@]}"; do
        # 查找并清空所有含有 "cache" 名称的文件夹
        find "$directories" -type d \( -name "cache" -o -name "*cache" -o -name "*_cache" -o -name "cache_*" -o -name "*.cache" \) -exec sh -c '
  for dir; do
    # 检查目录是否为空
    if [ "$(ls -A "$dir")" ]; then
      rm -rf "$dir"/*
    fi
  done
' sh {} +

    done

    echo "缓存已清空。"
   echo " "
else
echo " "
    echo " - 操作已取消。"
    echo " "
    echo " "
fi

echo " - 您确定要强行停止QQ和微信吗？【建议停止】(y/n): "
read answer

if [[ "$answer" == "y" ]]; then
    # 强行停止微信
    pkill -f "com.tencent.mm"

    # 强行停止QQ
    pkill -f "com.tencent.mobileqq"

    echo " - 微信和QQ已强行停止。"
    echo " "
else
echo " "
    echo " - 操作已取消。"
fi