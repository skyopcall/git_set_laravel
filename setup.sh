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

PROJECT_FOLDER=""
echo -en "계정 안에 프로젝트 폴더가 있나요? (y/n)";
read check
case $check in
    Y|y) 
        echo "프로젝트 폴더명을 입력해주세요.(실제로 프로젝트 폴더가 생성되는 곳)"
        echo "
            예시) 
                    계정경로 : /home/dev/
                    프로젝트 파일명 : test_company

                    우분투(리눅스 터미널)에서 프로젝트 폴더에서 pwd 라는 명령어를 입력했을 때
                    /home/dev/test_company 가 아닌 /home/dev/project/test_compay 라고 보인다면
                    project가 프로젝트 폴더명 입니다.


        "
        echo -en "입력: "
        read PROJECT_FOLDER
    ;;
esac

echo "
#custom environment variable
export SH_FOLDER_NAME=$GET_SH_PATH
export PROJECT_DIR=$PROJECT_FOLDER
export GET_SH_LIB_PATH=$GET_SH_PATH/lib
alias setLaravel='$GET_SH_PATH/main.sh'
">> ~/.bashrc

source ~/.bashrc

sed -i -e 's/^M$//' $GET_SH_PATH/lib/main.sh
# ln -s $GET_SH_PATH/lib/main.sh $GET_SH_PATH/main
chmod 700 $GET_SH_PATH/lib/main.sh

cat ~/.bashrc | tail -10
ls -al $GET_SH_PATH/

echo "초기 세팅 완료 !!!!!"
echo "1. chmod 700 setup.sh 실행!";
echo "2. ./setup.sh 실행!"
echo " '^m bad interpreter no such file or directory' 이와 같은 에러 발생시"
echo "      1. vi ./setup.sh"
echo "      2. :set ff=unix"
echo "      3. :wq"
echo "      4. ./setup.sh 다시 실행"