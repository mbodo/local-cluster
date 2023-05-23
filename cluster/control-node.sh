#!.bin/bash

sudo kubeadm init --apiserver-advertise-address 192.168.170.2 --apiserver-cert-extra-sans control01 --pod-network-cidr 10.32.0.0/12 --service-cidr 10.96.0.0/24 --cri-socket unix:///var/run/cri-dockerd.sock

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#kubeadm join 192.168.170.2:6443 --token 7jrta4.hjmz4vjwgnkipimc \
#        --discovery-token-ca-cert-hash sha256:a72ae4814d5c740a667a8663e021ee33067f49bb4609b409d07cc1a1b2316379

#kubeadmin token create --rpint-join-command

#kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=\
#$(kubectl version | base64 | tr -d '\n')"

kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

