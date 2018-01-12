#!/bin/bash

install_ETCD() {
	ETCD_VER=v3.2.7
	#choose either URL
	GOOGLE_URL=https://storage.googleapis.com/etcd
	GITHUB_URL=https://github.com/coreos/etcd/releases/download
	DOWNLOAD_URL=${GOOGLE_URL}
	DOWNLOAD_DRITORY=/data/software
	SOFT_INSTALL_DIRTORY=/usr/local/etcd
	mkdir -p ${DOWNLOAD_DRITORY}
	curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o ${DOWNLOAD_DRITORY}/etcd-${ETCD_VER}-linux-amd64.tar.gz
	tar xzvf ${DOWNLOAD_DRITORY}/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /${DOWNLOAD_DRITORY}/ 	 --strip-components=1
}
	
install_DOCKER() {

}