#!/bin/bash

function MOVE_FILE_SSH(){
    echo "HOST 정보를 입력해 주세요. "
    echo -en "ex) 123.123.123.123 , test.gabia.io : "
    read host

    echo -en "DB_USERNAME 정보를 입력해주세요. : "
    read username

    echo -en "DB_PASSWORD 정보를 입력해주세요. : "
    read password

    local db_host=
    if [[ "$str" =~ gabia.io ]]; then
        local db_host=db.$host
    else
        local db_host=$host
    fi


    if [ -e $SET_WWW_DATA_PATH/.htaccess ]; then
        cat /dev/null > $SET_WWW_DATA_PATH/.htaccess 
    fi

    echo '<IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteBase /
    RewriteCond $1 !^(public)/' >> $SET_WWW_DATA_PATH/.htaccess
    echo "  RewriteCond %{HTTP_HOST} ^(www.)?$username.gabia.io [NC]" >> $SET_WWW_DATA_PATH/.htaccess
    echo ' RewriteRule ^(.*)$ /public/$1 [L]
    </IfModule>' >> $SET_WWW_DATA_PATH/.htaccess

    cp $SET_WWW_DATA_PATH/.env $SET_WWW_DATA_PATH/.env.dev

    #DB_HOST=bj-mysql-1
    sed -i "s/DB_HOST=$GET_DOCKER_MYSQL_EXEC_TEXT/DB_HOST=$db_host/g" .env

    #DB_DATABASE=dev
    sed -i "s/DB_DATABASE=dev/DB_DATABASE=db{$username}/g" .env

    #DB_USERNAME=dev
    sed -i "s/DB_USERNAME=dev/DB_USERNAME=$username/g" .env

    #DB_PASSWORD=dev
    sed -i "s/DB_PASSWORD=dev/DB_PASSWORD=$password/g" .env

    # echo -en "FTP 비밀번호를 입력해주세요. : "
    # read password

    cd $SET_HOME_PATH
    tar -zcvf move_file_data.tar.gz www-data
    local dump_file_name=GET_MYSQL_DESC_SORT_DUMP_FILE
    scp move_file_data.tar.gz ../mysql_dump/$dump_file_name $username@$host:/

    local command="cd /;"
    command=$command"tar -zxvf move_file_data.tar.gz;"
    command=$command"rm -rf /www-data/.env.dev;"
    command=$command"ln -s /www-data/storage/app/public /www-data/public/storage;"
    command=$command"mysql -h$db_host -u$username -p db$username < /$dump_file_name;rm -rf /$dump_file_name;"

    ssh $username@$host $command;

    rm -f $SET_WWW_DATA_PATH/.env
    rm -f $SET_HOME_PATH/move_file_data.tar.gz
    mv $SET_WWW_DATA_PATH/.env.dev $SET_WWW_DATA_PATH/.env

    # cp -> modify -> scp -> rm -> move 
    # env => 실제 DB정보로 수정
    # FTP 전부 복사
    # env => 로컬 정보로 수정
}