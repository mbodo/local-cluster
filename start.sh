#!/bin/bash

virsh start control01 && \
virsh start node01 && \
virsh start node02

exit 0
