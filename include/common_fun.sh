function SET_LOG(){
    local TITLE=$1
    local CONTENT=$2

    # echo -e "\033[47;30m[$1]\033[0m \033[47;30m$2\033[0m ";
    if [ $? -eq 0 ];then
        echo -e "[ \033[40;32mSUCCESS\033[0m ] [ $1 ] $2"
    else
        # 명령어 실패시
        echo -e "[ \033[40;31mFAIL\033[0m ] $1 "
        exit 1
    fi
}

# function DOCKER_RUN_PHP_COMMAND(){
#     docker exec $GET_DOCKER_PHP_EXEC_TEXT php artisan $1 && 1> /dev/null
#     SET_LOG $1
# }

function DOCKER_RUN_PHP_COMMAND(){
    docker exec $GET_DOCKER_PHP_EXEC_TEXT sh -c "$1" && 1> /dev/null
    SET_LOG "docker sh command" $1
}

function DOCKER_RUN_MYSQL_COMMAND(){
    local COMMAND=$1
    docker exec $GET_DOCKER_MYSQL_EXEC_TEXT sh -c "$COMMAND"
}

function GET_MYSQL_DESC_SORT_DUMP_FILE(){
    local path=$GET_SH_PATH;
    cd $GET_MYSQL_DUMP_FILE_PATH;
    local file_name=`ls -tr $COMPANY_NAME-mysql* | tail -1`
    cd $path

    echo $file_name
}