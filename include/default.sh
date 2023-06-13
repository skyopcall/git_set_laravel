#!/bin/bash

# default
USER_PATH='dev';
FILE_NAME="setting_dev"
COMPANY_NAME="bj"

GET_HOST_DB_HOST_NAME="start"
SET_HOST_DB_HOST_NAME=$COMPANY_NAME
SET_HOME_PATH="/home/$USER/$COMPANY_NAME";
SET_WWW_DATA_PATH="$SET_HOME_PATH/www-data"

GET_SH_PATH=`pwd`
GET_SH_FILE_PATH="$GET_SH_PATH/file"
GET_MYSQL_DUMP_FILE_PATH="$SET_HOME_PATH/mysql_dump"

SET_ENV_FILE_PATH=$SET_WWW_DATA_PATH/.env
SET_ENV_EXAMPLE_FILE_PATH=$SET_WWW_DATA_PATH/.env.example

GET_DOCKER_PHP_EXEC_TEXT="$SET_HOST_DB_HOST_NAME-php-1"
GET_DOCKER_MYSQL_EXEC_TEXT="$SET_HOST_DB_HOST_NAME-mysql-1"
GET_DOCKER_PHP_EXEC_CODE=""
GET_DOCKER_MYSQL_EXEC_CODE=""

TT=`date +%Y%m%d%H%M%S`;
MYSQL_DUMP_FILE_NAME="$COMPANY_NAME-mysql-$TT.sql"
MYSQL_DATA_PATH="/mysql_dump"

FILE_PATH=`pwd`