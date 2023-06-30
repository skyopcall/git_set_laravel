#!/bin/bash
source $GET_SH_LIB_PATH/include/default.sh;
source $GET_SH_LIB_PATH/include/common_fun.sh;
source $GET_SH_LIB_PATH/include/load_fun.sh;
source $GET_SH_LIB_PATH/include/database_fun.sh;
source $GET_SH_LIB_PATH/include/git_fun.sh;
source $GET_SH_LIB_PATH/include/f_set_fun.sh;

if [ -z $1 ];then
    echo "생성 된 프로젝트 폴더 명이 존재 하지 않습니다."
    echo "예시) ./load.sh test_company"
    exit 0;
fi

# 변수 재 설정
SET_GLOBAL_VALUES $1

clear
#선택 사항 출력
while :
do
    echo -e "
        ==================================================
        ==                                              ==
        ==              [ \033[40;32m$1\033[0m ] 프로젝트               ==
        ==            First Setting Module              ==
        ==                                              ==
        ==================================================
        ==                                              ==
        ==              1. itc-start 세팅               ==
        ==                                              ==
        ==              2. git clone                    ==
        ==                                              ==
        ==              3. Laravel 세팅                 ==
        ==                                              ==
        ==              4. DB 내보내기                  ==
        ==                                              ==
        ==              5. DB 가져오기                  ==
        ==                                              ==
        ==         6. 데이터 베이스 Refresh             ==
        ==                                              ==
        ==         7. 호스팅에 데이터 옯기기             ==
        ==                                              ==
        ==                                              ==
        ==                                              ==
        ==                                              ==
        ==                                              ==
        ==                                              ==
        ==               0. 나가기                      ==
        ==                                              ==
        ==================================================

                    버전 : $VERSION

                    나가기 : Ctrl + c

        ==================================================
    "

    echo -en "번호를 입력해 주세요. : "
    read number
    echo ""

    case $number in
        1) 
            GIT_CLONE "itc-start"
            first_build $1
        ;;
        2) 
            GIT_CLONE
            echo -en "Laravel 세팅도 진행할까요? (y|n) : "
            read yn

            if [ "$yn" == "y" ] || [ "$yn" == "Y" ];then
                first_build $1
            fi
        ;;
        3) first_build $1;;
        4) SET_DOCKER_RUN_MYSQL_DUMP $1 ;;
        5)  ECHO_READY ;;
        6)  ECHO_READY ;;
        7)  ECHO_READY ;;
        *) exit 0 ;;
    esac
done