function DOCKER_RUN_MYSQL_DUMP(){
    docker exec $GET_DOCKER_MYSQL_EXEC_TEXT cd $MYSQL_DATA_PATH;ls;
    docker exec $GET_DOCKER_MYSQL_EXEC_TEXT cd $MYSQL_DATA_PATH;mysqldump -u dev --no-tablespaces --skip-add-drop-table -p'dev' dev > $MYSQL_DATA_PATH/$MYSQL_DUMP_FILE_NAME;
    SET_LOG mysql_dump
}

