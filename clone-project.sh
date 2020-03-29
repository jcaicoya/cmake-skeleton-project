#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Invalid parameters: usage ./clone-project.sh path-to-directory [--force]"
	exit 1
fi

OUTPUT_PATH=$1
USING_FORCE=0

if [ "$2" == "--force" ]; then
	USING_FORCE=1
fi

if [ -a $OUTPUT_PATH ]; then
	if [ $USING_FORCE -eq 1 ]; then
		echo "$OUTPUT_PATH exists: deleting it (backup copy is building)"
		cp -rf $OUTPUT_PATH ${OUTPUT_PATH}-backup
		rm -rf $1
	else
		echo "$1 exists: use --force argument to delete it"
		exit 2
	fi
fi

mkdir $OUTPUT_PATH
if [ $? -ne 0 ] ; then
    echo "$OUTPUT_PATH could not be built"
    exit 3
fi

cp CMakeLists.txt $OUTPUT_PATH

mkdir ${OUTPUT_PATH}/mylib
cp mylib/CMakeLists.txt ${OUTPUT_PATH}/mylib
cp mylib/prime.h ${OUTPUT_PATH}/mylib
cp mylib/prime.cpp ${OUTPUT_PATH}/mylib

mkdir ${OUTPUT_PATH}/mytest
cp mytest/CMakeLists.txt ${OUTPUT_PATH}/mytest
cp mytest/primeTest.cpp ${OUTPUT_PATH}/mytest
cp mytest/main.cpp ${OUTPUT_PATH}/mytest

mkdir ${OUTPUT_PATH}/myapp
cp myapp/CMakeLists.txt ${OUTPUT_PATH}/myapp
cp myapp/main.cpp ${OUTPUT_PATH}/myapp

mkdir ${OUTPUT_PATH}/.vscode
cp .vscode/c_cpp_properties.json ${OUTPUT_PATH}/.vscode
cp .vscode/launch.json ${OUTPUT_PATH}/.vscode
cp .vscode/tasks.json ${OUTPUT_PATH}/.vscode

echo "Directories and files are been cloned in ${OUTPUT_PATH}, including vscode configuration files"
echo "Please, do not forget to configure CMake in VSCode: Ctrl + Shift + p --> CMake: Configure"
echo "Enjoy coding!"
