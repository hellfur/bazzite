#!/bin/bash

set -ouex pipefail

BAZZITE_KERNEL=`ls /lib/modules`
rpm-ostree install kernel-headers kernel-devel-$BAZZITE_KERNEL
