#!/bin/bash

echo ' '
echo "Данный скрипт вычисляет контрольную сумму одного файла и записывает результат в другой"
echo ' '
echo "Разработчик: Яна Буравенкова"
echo ' '
pwd
echo ' '
a="yes"
while [ $a = "yes" ];
do
	echo "Введите имя файла, контрольную сумму которого Вы хотите вычислить"
	read file
	echo ' '
	find . -name "$file" 
	if [ -f $file ]; then
		md5sum $file
		echo ' '
		c="yes"
	else
		echo "Такого файла не сществует. Повторить процедуру? Выберите ( yes / no )"
		read a
		c="no"
	fi
	while [[ $c = "yes" && $a = "yes" ]];
	do
		echo "Введите имя файла, в который вы хотите записать контрольную сумму первого файла"
		read file2
		find . -name "$file2"
		if [ -f $file2 ]; then
			echo "Файл существует. Разрешить запись в файл? Выберите ( yes / no )"
			read b
			if [ b = "yes" ]; then
				md5sum $file > $file2
			fi
		else
			echo  "Ошибка! Такого файла не существует или он пуст."
		fi
		echo "Хотите повторить процедуру? Введите ( yes / no ) "
		read a
		c="no"
	done
done











