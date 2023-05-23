#!/bin/bash

virsh shutdown node02 && \
virsh shutdown node01 && \
virsh shutdown control01

sleep 30

virsh undefine control01 && \
virsh undefine node01 && \
virsh undefine node02

exit 0
