#!/bin/bash

DOWNLOAD_URL=https://github.com/etcd-io/etcd/releases/download ETCD_VER=v3.5.4; \
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz; \
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test; \
curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz && \
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1 && \
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

echo 'export PATH=$PATH:/tmp/etcd-download-test' >> ~/.bashrc

exit 0
