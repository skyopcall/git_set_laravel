#!/bin/bash

source include/default.sh;
source include/load_fun.sh;

# env 카피 및 DB_HOST 값 수정
SET_ENV_DB_HOST

#세팅!!
SET_BUILD

#mysql 가져오기
# SET_MYSQL_DATA