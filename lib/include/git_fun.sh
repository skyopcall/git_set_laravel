#!/bin/badn

function GIT_CLONE(){
    local git_url=$1
    if [ -z $git_url ]; then
        echo "git clone 을 실행할 git 주소를 입력해 주세요. "
        echo "git clone https://github.com/asom2530/itc-start 라면 itc-start 만 입력! "
        echo -en "주소 입력 : "
        read git_url
    fi

    git clone https://github.com/asom2530/$git_url $SET_HOME_PATH;
    SET_VIEW_LOG "git clone $git_url" $? "itc start git clone error";

}

function GIT_PULL(){
    echo "준비중입니다."
}

function GIT_PUSH(){
    echo "준비중입니다."
    
}

function GIT_STASH(){
    echo "준비중입니다."
    
}