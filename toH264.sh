for i in $1/*
do
	inPath=${i%/*}   ## 输入路径目录
	file1=${i##*/}
	fileName=${file1%.*}    ##源文件文件名

	## 判断输入是否带有斜杆
	if [[ $inPath =~ /$ ]];then
		outPath=$inPath"Out/"
		## echo "输入路径是以斜杆结尾"
	else
		outPath=$inPath"/Out/"
		## echo "输入路径不是以斜杆结尾"
	fi

	## 没有则创建目录
	mkdir -p $outPath
	
    ffmpeg -i $i -vcodec libx264 -preset medium -crf 18 $outPath$fileName.mp4
done

echo "output directory: $outPath"
echo "Finish"

## 批量转码视频文件到MP4
## 使用方法：./FFmpeg_batch.sh 文件夹路径
## For Example: ./FFmpeg_batch.sh ~/Movies/testVideo/
## 适用Unix系统
