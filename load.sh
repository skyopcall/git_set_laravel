#!/bin/bash

source include/default.sh;
source include/common_fun.sh;
source include/load_fun.sh;

# env 카피 및 DB_HOST 값 수정
SET_ENV_DB_HOST


#docker-compose.yml 복사( 재세팅 ) => 후에 mysql backup 을 받기위 한 폴더 생성 코드 추가
SET_DOCKER_COMPOSE_COPY

#세팅!!
SET_BUILD

#mysql 가져오기
SET_MYSQL_DATA