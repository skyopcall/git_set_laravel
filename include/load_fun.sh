#!/bin/bash

function SET_ENV_DB_HOST(){
    # env 파일 변경할 내용 
    local get_before_db_host="DB_HOST=$GET_HOST_DB_HOST_NAME"
    local change_db_host="DB_HOST=$SET_HOST_DB_HOST_NAME"

    sed -e "s/$get_before_db_host/$change_db_host/g" $SET_ENV_EXAMPLE_FILE_PATH > $SET_ENV_FILE_PATH
    # sed -i 's/{$get_before_db_host}/{$change_db_host}/g' $SET_ENV_EXAMPLE_FILE_PATH > $SET_ENV_FILE_PATH
    
    # 확인 로그
    local env=`ls $SET_ENV_FILE_PATH`;
    local log_db_host=`sed -n "/$change_db_host/p" $SET_ENV_FILE_PATH`

    SET_LOG COPY_ENV_FILE $env
    SET_LOG CHANGE_DB_HOST_ENV "$log_db_host"
}

function SET_DOCKER_COMPOSE_COPY(){
    cp $GET_SH_FILE_PATH/docker-compose.yml $SET_HOME_PATH/docker-compose.yml

    SET_LOG docker-compose COPY_OK
}

function SET_BUILD(){
    # docker up
    SET_DOCKER_UP_DEV

    # php get docker exec code 
    GET_DOCKER_CODE
    
    # LOG 확인을 위한 슬립
    sleep 3
    
    # docker exec php composer install
    SET_COMPOSER_INSTALL

    #docker exec php artisan
    SET_PHP_ARTISAN
}

function GET_DOCKER_CODE(){
    GET_DOCKER_PHP_EXEC_CODE=`docker ps | grep $GET_DOCKER_PHP_EXEC_TEXT`
    GET_DOCKER_MYSQL_EXEC_CODE=`docker ps | grep $GET_DOCKER_MYSQL_EXEC_TEXT`

    SET_LOG PHP_EXEC_CODE $GET_DOCKER_PHP_EXEC_CODE
    SET_LOG MYSQL_EXEC_CODE $GET_DOCKER_MYSQL_EXEC_CODE
}

function SET_DOCKER_UP_DEV(){
    cd $SET_HOME_PATH;
    docker-compose up -d 1> /dev/null;
    SET_LOG docker_compose_up
}

function SET_COMPOSER_INSTALL(){
    # docker exec $GET_DOCKER_PHP_EXEC_TEXT composer install && 1> /dev/null
    DOCKER_RUN_PHP_COMMAND "composer install"
    SET_LOG compose_install
}

function SET_PHP_ARTISAN(){
    # DOCKER_RUN_PHP_COMMAND migrate
    # DOCKER_RUN_PHP_COMMAND db:seed
    DOCKER_RUN_PHP_COMMAND "php artisan key:generate"
    DOCKER_RUN_PHP_COMMAND "php artisan storage:link"
    DOCKER_RUN_PHP_COMMAND "php artisan optimize:clear"
}

function SET_MYSQL_DATA(){
    local file_name=`GET_MYSQL_DESC_SORT_DUMP_FILE`

    if [ -e $GET_MYSQL_DUMP_FILE_PATH/$file_name ] ; then
        DOCKER_RUN_MYSQL_COMMAND "mysql -u dev  -p'dev' dev < /mysql_dump/$file_name"
        # docker exec $GET_DOCKER_MYSQL_EXEC_TEXT sh -c "mysql -u dev  -p'dev' dev < /mysql_dump/$file_name";
        
        SET_LOG mysql_dump $file_name;
    else 
        DOCKER_RUN_PHP_COMMAND "php artisan migrate"
        DOCKER_RUN_PHP_COMMAND "php artisan db:seed"

        SET_LOG mysql_dump php_artisan_migrate_and_db:seed
    fi
}