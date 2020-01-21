#!/bin/sh
test -z $1 && echo "you must input the filename that you want to repair!" && exit 0
#test -z $2 && echo "you must input the name that to regular(固定部分)" && exit 0

shell_path=$(cd `dirname $0`;pwd)
change_auto_path="${shell_path}/$1"
script_text="${shell_path}/script.sed"
search_xargs="-"
#echo "${search_xargs}"
#echo "${change_auto_path}"
#read -p "please to input the name that you want to use!"  name
touch ${shell_path}/filename.txt
chmod 777 ${shell_path}/filename.txt
for filename in `ls ${change_auto_path}`
do
	# save filename to ${change_auto_path}/filename.txt
	echo ${filename} > ${shell_path}/filename.txt
	## 从 ${shell_path}/filename.txt 这个文件中查找是否含有关键字 ${search_xargs}
	grep -q ${search_xargs} ${shell_path}/filename.txt
	if [ "$?" -eq "0" ] ;then 
		continue		# 如果含有该关键字则退出，进行下次循环
	fi
	newfilename="$2`echo ${filename} | sed -f  ${script_text}`"
#	echo ${newfilename}	
	mv "${change_auto_path}/${filename}"  "${change_auto_path}/${newfilename}"
done
exit 0

