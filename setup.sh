#!/bin/bash

# virsh net-create cluster.xml

# To be able to enable autostart the
# virsh net-edit kind needs to be started and
# at the end of xml add the empty line then save
# autostart the will be enbled
#
# Example:
# virsh net-edit cluster
# <CR>G
# o<Esc>
# !wqa
#
# Than execute the $virsh net-edit cluster

# virsh net-autostart cluster

#https://blog.christophersmart.com/2016/08/31/configuring-qemu-bridge-helper-after-access-denied-by-acl-file-error/
#echo "allow all" | sudo tee /etc/qemu-kvm/${USER}.conf
#echo -e "include /etc/qemu-kvm/${USER}.conf" | sudo tee --append /etc/qemu-kvm/bridge.conf
#sudo chown root:${USER} /etc/qemu-kvm/${USER}.conf
#sudo chmod 640 /etc/qemu-kvm/${USER}.conf
# https://www.fatalerrors.org/a/qemu-kvm-a-tool-for-creating-kvm-virtual-machine.html

#virt-builder ubuntu-16.04 \
#-o /mnt/data/ubuntu-16.04.qcow2 \
#--arch x86_64 \
#--size 20G \
#-m 4096 \
#--root-password password:welcome1 \
#--ssh-inject root:file:/home/bmlynarcik/.ssh/id_rsa.pub \
#--format qcow2

#TODO remove from ~/.ssh/known_hosts lines with:
# 192.168.170.2 ...
# 192.168.170.3 ...
# 192.168.170.4 ...
#
# Handle later with some script/command

#cp -v /mnt/data/ubuntu.qcow2 /mnt/data/control01.qcow2 && \
#cp -v /mnt/data/ubuntu.qcow2 /mnt/data/node01.qcow2 && \
#cp -v /mnt/data/ubuntu.qcow2 /mnt/data/node02.qcow2
#
#virt-install --name control01 \
#--vcpus 2 \
#--memory 4096 \
#--disk path=/mnt/data/control01.qcow2,bus=virtio,size=20,sparse=false \
#--os-type linux \
#--os-variant ubuntu20.04 \
#--network network=cluster,model=virtio,mac=52:54:00:06:0b:95 \
#--rng /dev/urandom \
#--graphics none \
#--console pty,target_type=virtio \
#--noautoconsole \
#--boot hd
#
#virt-install --name node01 \
#--vcpus 2 \
#--memory 4096 \
#--disk path=/mnt/data/node01.qcow2,bus=virtio,size=20,sparse=false \
#--os-type linux \
#--os-variant ubuntu20.04 \
#--network network=cluster,model=virtio,mac=52:54:00:8d:5b:f2 \
#--rng /dev/urandom \
#--graphics none \
#--console pty,target_type=virtio \
#--noautoconsole \
#--boot hd
#
#virt-install --name node02 \
#--vcpus 2 \
#--memory 4096 \
#--disk path=/mnt/data/node02.qcow2,bus=virtio,size=20,sparse=false \
#--os-type linux \
#--os-variant ubuntu20.04 \
#--network network=cluster,model=virtio,mac=52:54:00:e9:5b:70 \
#--rng /dev/urandom \
#--graphics none \
#--console pty,target_type=virtio \
#--noautoconsole \
#--boot hd
#
#sleep 10
#
# printf "=> Set hostname \n"
#
#ssh -o StrictHostKeyChecking=accept-new ubuntu@192.168.170.2 -C "sudo hostnamectl hostname control01"
#ssh -o StrictHostKeyChecking=accept-new ubuntu@192.168.170.3 -C "sudo hostnamectl hostname node01"
#ssh -o StrictHostKeyChecking=accept-new ubuntu@192.168.170.4 -C "sudo hostnamectl hostname node02"
#
# printf "=> Configure /etc/hosts \n"
#
# ssh ubuntu@192.168.170.2 -C "sudo sh -c 'echo 192.168.170.2 control01 >> /etc/hosts && echo 192.168.170.3 node01 >> /etc/hosts && echo 192.168.170.4 node02 >> /etc/hosts'"
# ssh ubuntu@192.168.170.3 -C "sudo sh -c 'echo 192.168.170.2 control01 >> /etc/hosts && echo 192.168.170.3 node01 >> /etc/hosts && echo 192.168.170.4 node02 >> /etc/hosts'"
# ssh ubuntu@192.168.170.4 -C "sudo sh -c 'echo 192.168.170.2 control01 >> /etc/hosts && echo 192.168.170.3 node01 >> /etc/hosts && echo 192.168.170.4 node02 >> /etc/hosts'"
#
# printf "=> Configure timedate \n"
#
#ssh ubuntu@192.168.170.2 -C "sudo timedatectl set-timezone Europe/Bratislava"
#ssh ubuntu@192.168.170.3 -C "sudo timedatectl set-timezone Europe/Bratislava"
#ssh ubuntu@192.168.170.4 -C "sudo timedatectl set-timezone Europe/Bratislava"
#
# printf "=> Switch off /swap.img \n"
#
#ssh ubuntu@192.168.170.2 -C "sudo sed -i 's,^/swap.img,#/swap.img,' /etc/fstab"
#ssh ubuntu@192.168.170.3 -C "sudo sed -i 's,^/swap.img,#/swap.img,' /etc/fstab"
#ssh ubuntu@192.168.170.4 -C "sudo sed -i 's,^/swap.img,#/swap.img,' /etc/fstab"
#
#ssh ubuntu@192.168.170.2 -C "sudo sh -c 'swapoff -a'"
#ssh ubuntu@192.168.170.3 -C "sudo sh -c 'swapoff -a'"
#ssh ubuntu@192.168.170.4 -C "sudo sh -c 'swapoff -a'"
#
# printf "=> Install kubeadm, kubelet, kubectl \n"
#
# printf "=> Configure network \n"
#
#scp scripts/network.sh ubuntu@192.168.170.2:/home/ubuntu && ssh ubuntu@192.168.170.2 -C "sudo sh -c 'chmod 0744 network.sh && ./network.sh'"
scp scripts/network.sh ubuntu@192.168.170.3:/home/ubuntu && ssh ubuntu@192.168.170.3 -C "sudo sh -c 'chmod 0744 network.sh && ./network.sh'"
scp scripts/network.sh ubuntu@192.168.170.4:/home/ubuntu && ssh ubuntu@192.168.170.4 -C "sudo sh -c 'chmod 0744 network.sh && ./network.sh'"
#
# printf "=> Install docker-ce \n"
#
#scp scripts/docker.sh ubuntu@192.168.170.2:/home/ubuntu && ssh ubuntu@192.168.170.2 -C "sudo sh -c 'chmod 0744 docker.sh && ./docker.sh'"
#scp scripts/docker.sh ubuntu@192.168.170.3:/home/ubuntu && ssh ubuntu@192.168.170.3 -C "sudo sh -c 'chmod 0744 docker.sh && ./docker.sh'"
#scp scripts/docker.sh ubuntu@192.168.170.4:/home/ubuntu && ssh ubuntu@192.168.170.4 -C "sudo sh -c 'chmod 0744 docker.sh && ./docker.sh'"
#
# printf "=> Install cri-dockerd \n"
#
#scp scripts/cri-dockerd.sh ubuntu@192.168.170.2:/home/ubuntu && ssh ubuntu@192.168.170.2 -C "sudo sh -c 'chmod 0744 cri-dockerd.sh && ./cri-dockerd.sh'"
#scp scripts/cri-dockerd.sh ubuntu@192.168.170.3:/home/ubuntu && ssh ubuntu@192.168.170.3 -C "sudo sh -c 'chmod 0744 cri-dockerd.sh && ./cri-dockerd.sh'"
#scp scripts/cri-dockerd.sh ubuntu@192.168.170.4:/home/ubuntu && ssh ubuntu@192.168.170.4 -C "sudo sh -c 'chmod 0744 cri-dockerd.sh && ./cri-dockerd.sh'"
#
# printf "=> Install kubeadm, kubelet, kubectl \n"
#
#scp scripts/k8s-tools.sh ubuntu@192.168.170.2:/home/ubuntu && ssh ubuntu@192.168.170.2 -C "sudo sh -c 'chmod 0744 k8s-tools.sh && ./k8s-tools.sh'"
#scp scripts/k8s-tools.sh ubuntu@192.168.170.3:/home/ubuntu && ssh ubuntu@192.168.170.3 -C "sudo sh -c 'chmod 0744 k8s-tools.sh && ./k8s-tools.sh'"
#scp scripts/k8s-tools.sh ubuntu@192.168.170.4:/home/ubuntu && ssh ubuntu@192.168.170.4 -C "sudo sh -c 'chmod 0744 k8s-tools.sh && ./k8s-tools.sh'"
#
# printf "=> Restart virtual machines \n"
#
#./shutdown.sh && sleep 30 && ./start.sh

exit 0
