#!/bin/bash
source $GET_SH_LIB_PATH/include/default.sh;
source $GET_SH_LIB_PATH/include/common_fun.sh;
source $GET_SH_LIB_PATH/include/load_fun.sh;
source $GET_SH_LIB_PATH/include/database_fun.sh;

if [ -z $1 ];then
    echo "생성 된 프로젝드 폴더 명이 존재 하지 않습니다."
    echo "예시) ./load.sh test_company"
    exit 1;
fi

#선택 사항 출력
echo -e "
    ==================================================
    ==                                              ==
    ==              [ \033[40;32m$1\033[0m ] 프로젝트                 ==
    ==            First Setting Module              ==
    ==                                              ==
    ==================================================
    ==                                              ==
    ==         1. 신규 세팅(git clone 포함)          ==
    ==                                              ==
    ==              2. Laravel 세팅                  ==
    ==                                              ==
    ==              3. DB 내보내기                    ==
    ==                                              ==
    ==              4. DB 가져오기                    ==
    ==                                              ==
    ==         5. 데이터 베이스 Refresh             ==
    ==                                              ==
    ==                                              ==
    ==================================================

                프로트 타입 $VERSION 

    ==================================================
"

echo -en "번호를 입력해 주세요. : "
read number
echo ""

# 변수 재 설정
SET_GLOBAL_VALUES $1

case $number in
    1) echo "준비중 입니다...." ;;
    2) first_build $1;;
    3) SET_DOCKER_RUN_MYSQL_DUMP $1 ;;
    4) echo "준비중 입니다...." ;;
    5) echo "준비중 입니다...." ;;
    *) echo '다시 실행해 주세요.' ;;
esac