#!/bin/badn

function GIT_CLONE(){
    echo "clone 파일을 추가할 폴더명을 작성해 주세요."
    read company_name

    echo "clone 할 git의 마지막 폴더명을 작성해 주세요."
    echo "EX) https://github.com/asom2530/baekjeworldheritage 에서 baekjeworldheritage 만 작성"
    read git_clone_name

    # mkdir /home/$USER/$company_name
    # cd /home/$USER/$company_name
    # git clone https://github.com/asom2530/$git_clone_name .
    # cd $GET_SH_PATH
}

function GIT_PULL(){
    
}

function GIT_PUSH(){
    
}

function GIT_STASH(){
    
}