#!/usr/bin/env bash

CURRENT_DIR=$(cd `dirname $0`; pwd)

PROG_NAME=$0
ACTION=$1
SERVER=$2

installJava() {
	cd ${CURRENT_DIR};
	git clone git@bitbucket.org:cduym/adcdemo.git
	cd adcdemo
	./package.sh
	./deploy.sh restart prod
}

installNode() {
	cd ${CURRENT_DIR};
	git clone git@bitbucket.org:cduym/yiduncaptchacracker.git
	cd yiduncaptchacracker/source/slide_captcha
	if [ "${SERVER}" == "server" ]; then
		cnpm install express
		nohup node server.js &
	fi
	
}

uninstallJava() {
	cd ${CURRENT_DIR}
	javapid=`ps -ef | grep java | grep AdcDemo | grep -v grep | awk '{print$2}'`;
	if [[ $javapid ]];then
            kill -9 ${javapid}
	fi
	rm -rf adcdemo schedulerx
}

uninstallNode() {
	cd ${CURRENT_DIR}
	nodepid=`ps -ef | grep node | grep server | grep -v grep | awk '{print$2}'`;
	if [[ $nodepid ]];then
	    kill -9 ${nodepid}
	fi
	rm -rf yiduncaptchacracker
}

getValidate() {
	cd ${CURRENT_DIR}
	cd yiduncaptchacracker/source/slide_captcha
	python3 mainProxy.py
}

case "$ACTION" in
    install)
        installJava
	installNode
    ;;
    uninstall)
	uninstallJava
	uninstallNode
    ;;
    run)
	getValidate
    ;;
esac
