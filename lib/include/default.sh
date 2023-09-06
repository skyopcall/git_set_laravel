#!/bin/bash

# default 전역변수 설정
USER=`whoami`/$PROJECT_FOLDER;
# SH_FOLDER_NAME="setting_dev/sh"
COMPANY_NAME=""
VERSION="v0.1.0";
TT=`date +%Y%m%d%H%M%S`;

SET_HOME_PATH="";
MYSQL_DUMP_FILE_NAME=""
GET_DOCKER_PHP_EXEC_TEXT=""
GET_DOCKER_MYSQL_EXEC_TEXT=""

GET_HOST_DB_HOST_NAME="start"
SET_WWW_DATA_PATH=""

GET_SH_PATH=""
GET_SH_FILE_PATH=""
GET_MYSQL_DUMP_FILE_PATH=""

SET_ENV_FILE_PATH=""
SET_ENV_EXAMPLE_FILE_PATH=""

GET_DOCKER_PHP_EXEC_CODE=""
GET_DOCKER_MYSQL_EXEC_CODE=""
MYSQL_DATA_PATH="/mysql_dump"

# SET_GIT_URL=""

FILE_PATH=`pwd`

function ECHO_READY(){
    clear
    echo "      =================================================="
    echo "      "
    echo "                        준비중입니다......"
    echo "      "
    echo "      =================================================="
    echo "      "
    echo "      "
    sleep 2
}