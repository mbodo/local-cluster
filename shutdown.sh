#!/bin/bash

virsh shutdown node02 && \
virsh shutdown node01 && \
virsh shutdown control01

exit 0
