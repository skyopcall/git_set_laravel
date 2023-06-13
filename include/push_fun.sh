function DOCKER_RUN_MYSQL_DUMP(){
    docker exec $GET_DOCKER_MYSQL_EXEC_TEXT mysqldump -u dev --no-tablespaces --skip-add-drop-table -p'dev' dev > $SET_HOME_PATH/$MYSQL_DUMP_FILE_NAME;
    SET_LOG mysql_dump $MYSQL_DATA_PATH/$MYSQL_DUMP_FILE_NAME;
}

function DOCKER_RUN_PHP_COMMAND(){
    local COMMAND=$1
    docker exec $GET_DOCKER_MYSQL_EXEC_TEXT COMMAND
}

