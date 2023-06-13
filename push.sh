#!/bin/bash
source include/default.sh;
source include/common_fun.sh;
source include/push_fun.sh;

#msql dump
SET_DOCKER_RUN_MYSQL_DUMP

# sudo ls -al $SET_HOME_PATH/mysql