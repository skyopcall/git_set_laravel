#!/bin/bash

# default 전역변수 설정
USER=`whoami`;
# SH_FOLDER_NAME="setting_dev/sh"
COMPANY_NAME=""
VERSION="v0.0.2";
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

SET_ENV_FILE_PATH=$""
SET_ENV_EXAMPLE_FILE_PATH=""

GET_DOCKER_PHP_EXEC_CODE=""
GET_DOCKER_MYSQL_EXEC_CODE=""
MYSQL_DATA_PATH="/mysql_dump"


FILE_PATH=`pwd`