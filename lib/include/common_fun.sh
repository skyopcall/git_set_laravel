function SET_LOG(){
    local COMMAND=$1
    local CONTENT=$2

    echo -e "[$COMMAND] $CONTENT"
}

function SET_VIEW_LOG(){
    local COMMAND=$1
    local RESULT=$2
    local CONTENT=$3

    if [ "${VARIABLE:-0}" == 0 ] ; then
        echo -e "[ \033[40;32mSUCCESS\033[0m ] [$COMMAND]"
    else
        # 명령어 실패시
        echo -e "[ \033[40;31mFAIL\033[0m ] [$COMMAND] $CONTENT"
        exit 0
    fi
}

# function DOCKER_RUN_PHP_COMMAND(){
#     docker exec $GET_DOCKER_PHP_EXEC_TEXT php artisan $1 && 1> /dev/null
#     SET_LOG $1
# }

function DOCKER_RUN_PHP_COMMAND(){
    local COMMAND=$1
    docker exec $GET_DOCKER_PHP_EXEC_TEXT sh -c "$COMMAND" 1> /dev/null

    SET_VIEW_LOG "$COMMAND" "$?"
}

function DOCKER_RUN_MYSQL_COMMAND(){
    local COMMAND=$1
    docker exec $GET_DOCKER_MYSQL_EXEC_TEXT sh -c "$COMMAND" 1> /dev/null
    SET_VIEW_LOG "$COMMAND" "$?"
}

function GET_MYSQL_DESC_SORT_DUMP_FILE(){
    cd $GET_MYSQL_DUMP_FILE_PATH;
    local file_name=`ls -tr $COMPANY_NAME-mysql* | tail -1`
    # cd $GET_SH_PATH

    echo $file_name
}


function SET_GLOBAL_VALUES(){
    COMPANY_NAME=$1
    SET_HOME_PATH="/home/$USER/$COMPANY_NAME";
    MYSQL_DUMP_FILE_NAME="$COMPANY_NAME-mysql-$TT.sql"
    GET_DOCKER_PHP_EXEC_TEXT="$COMPANY_NAME-php-1"
    GET_DOCKER_MYSQL_EXEC_TEXT="$COMPANY_NAME-mysql-1"

    GET_HOST_DB_HOST_NAME="start"
    SET_WWW_DATA_PATH="$SET_HOME_PATH/www-data"

    GET_SH_PATH=/home/$USER/$SH_FOLDER_NAME
    GET_SH_FILE_PATH="$GET_SH_LIB_PATH/file"
    GET_MYSQL_DUMP_FILE_PATH="$SET_HOME_PATH/mysql_dump"

    SET_ENV_FILE_PATH=$SET_WWW_DATA_PATH/.env
    SET_ENV_EXAMPLE_FILE_PATH=$SET_WWW_DATA_PATH/.env.example
}

function DOCKER_BUILD_CHECK(){
    if [ ! -d $SET_WWW_DATA_PATH ] ; then
        mkdir $SET_WWW_DATA_PATH
        mv $SET_HOME_PATH/* $SET_WWW_DATA_PATH
    fi
}