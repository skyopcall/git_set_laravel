#!/bin/bash

function SET_ENV_DB_HOST(){
    local get_before_db_host="DB_HOST=$GET_HOST_DB_HOST_NAME"
    local change_db_host="DB_HOST=$COMPANY_NAME"

    sed -e "s/$get_before_db_host/$change_db_host/g" $SET_ENV_EXAMPLE_FILE_PATH > $SET_ENV_FILE_PATH

    # 확인 로그
    local env_change_value=`sed -n "/$change_db_host/p" $SET_ENV_FILE_PATH`
    SET_LOG "SET_ENV_DB_HOST" "$env_change_value"

    ls $SET_ENV_FILE_PATH 1> /dev/null
    SET_VIEW_LOG "SET_ENV_DB_HOST" "$?"
}

function SET_DOCKER_COMPOSE_COPY(){
    cp $GET_SH_FILE_PATH/docker-compose.yml $SET_HOME_PATH/docker-compose.yml
    ls $SET_HOME_PATH/docker-compose.yml 1> /dev/null

    SET_VIEW_LOG "SET_DOCKER_COMPOSE_COPY" "$?"
}

function SET_BUILD(){
    # docker up
    SET_DOCKER_UP_DEV
    
    # LOG 확인을 위한 슬립
    sleep 3
    
    # docker exec php composer install
    SET_COMPOSER_INSTALL

    #docker exec php artisan
    SET_PHP_ARTISAN
}

function GET_DOCKER_CODE(){
    docker ps 1> /dev/null
    SET_VIEW_LOG "GET_DOCKER_CODE" "$?"
    
    GET_DOCKER_PHP_EXEC_CODE=`docker ps | grep $GET_DOCKER_PHP_EXEC_TEXT`
    GET_DOCKER_MYSQL_EXEC_CODE=`docker ps | grep $GET_DOCKER_MYSQL_EXEC_TEXT`

    echo ""
    SET_LOG "GET_DOCKER_CODE" "php:$GET_DOCKER_PHP_EXEC_CODE"
    SET_LOG "GET_DOCKER_CODE" "mysql:$GET_DOCKER_MYSQL_EXEC_CODE"

}

function SET_DOCKER_UP_DEV(){
    cd $SET_HOME_PATH;

    docker-compose up -d
    SET_VIEW_LOG "SET_DOCKER_UP_DEV" "$?"

    GET_DOCKER_CODE

    docker ps | grep $COMPANY_NAME | awk '{print $1, $2}'
}

function SET_COMPOSER_INSTALL(){
    # docker exec $GET_DOCKER_PHP_EXEC_TEXT composer install && 1> /dev/null
    DOCKER_RUN_PHP_COMMAND "composer install" 1> /dev/null

    # SET_VIEW_LOG "SET_COMPOSER_INSTALL" $?
}

function SET_PHP_ARTISAN(){
    DOCKER_RUN_PHP_COMMAND "php artisan key:generate"
    DOCKER_RUN_PHP_COMMAND "php artisan storage:link"
    DOCKER_RUN_PHP_COMMAND "php artisan optimize:clear"
}

function SET_MYSQL_DATA(){
    local file_name=`GET_MYSQL_DESC_SORT_DUMP_FILE`
    SET_LOG "SET_MYSQL_DATA" $file_name;

    if [ -n "$file_name" ]; then
        DOCKER_RUN_MYSQL_COMMAND "mysql -u dev  -p'dev' dev < /mysql_dump/$file_name"
    else 
        DOCKER_RUN_PHP_COMMAND "php artisan migrate"
        DOCKER_RUN_PHP_COMMAND "php artisan db:seed"
    fi
}

function first_build(){
    if [ ! -d  "$SET_HOME_PATH" ];then
        echo "프로젝트를 생성되지 않았습니다."
        echo "프로젝트 생성 및 clone 후 실행해 주세요."
        exit 1
    fi

    # env 카피 및 DB_HOST 값 수정
    SET_ENV_DB_HOST

    #docker-compose.yml 복사( 재세팅 ) => 후에 mysql backup 을 받기위 한 폴더 생성 코드 추가
    SET_DOCKER_COMPOSE_COPY

    #세팅!!
    SET_BUILD

    #mysql 가져오기
    SET_MYSQL_DATA

    sleep 2
}