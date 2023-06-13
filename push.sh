#!/bin/bash
source include/default.sh;
source include/push_fun.sh;

#msql dump
DOCKER_RUN_MYSQL_DUMP

# sudo ls -al $SET_HOME_PATH/mysql