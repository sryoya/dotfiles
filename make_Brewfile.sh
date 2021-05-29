#!/bin/bash
# refs: https://dackdive.hateblo.jp/entry/2015/01/05/173646

if [ -e Brewfile ]; then
	echo "Brewfile already exists. Please rename or remove it."
	exit
fi

for i in $(brew list)
do
	echo "install $i"
	echo "install $i" >>Brewfile
done
