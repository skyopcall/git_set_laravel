#!/bin/bash

USER=`whoami`
GET_SH_PATH=`pwd`
HOME=/home/$USER

# if [ -z "`cat ~/.bashrc | grep 'custom environment variable'`" ]; then
#     echo "#custom environment variable" >> ~/.bashrc
# fi

# if [ -z "`echo $SH_FOLDER_NAME`" ]; then
#     echo "export SH_FOLDER_NAME=$GET_SH_PATH" >> ~/.bashrc
# fi

# if [ -z "`echo $GET_SH_LIB_PATH`" ]; then
#     echo "export GET_SH_LIB_PATH=$GET_SH_PATH/lib" >> ~/.bashrc
# fi

# # setLaravel 1> /dev/nul
# echo "alias setLaravel='$GET_SH_PATH/main.sh'" >> ~/.bashrc


echo "

#custom environment variable
export SH_FOLDER_NAME=$GET_SH_PATH
export GET_SH_LIB_PATH=$GET_SH_PATH/lib
alias setLaravel='$GET_SH_PATH/main'

">> ~/.bashrc

source ~/.bashrc

ln -s $GET_SH_PATH/lib/main.sh $GET_SH_PATH/main

cat ~/.bashrc | tail -5
la -al $GET_SH_PATH/