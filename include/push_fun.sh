function SET_DOCKER_RUN_MYSQL_DUMP(){
    if [ ! -e $SET_HOME_PATH/mysql_dump/ ] ; then
        mkdir $SET_HOME_PATH/mysql_dump/
    fi

    local file_name=$MYSQL_DUMP_FILE_NAME

    DOCKER_RUN_MYSQL_COMMAND "mysqldump -u dev --no-tablespaces --skip-add-drop-table -p'dev' dev > /mysql_dump/$file_name";
    # cp $SET_HOME_PATH/$MYSQL_DUMP_FILE_NAME $GET_MYSQL_DUMP_FILE_PATH/

    SET_LOG mysql_ok $file_name;
}

