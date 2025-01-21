# SPDX-License-Identifier: BSD-3-Clause
# Base image for building compilers stack based on oracle linux 8
# Image with ARM compiler for ARM64 targets
FROM buildtools-base

# Interractive install through:
#   bash <(curl -L https://developer.arm.com/-/cdn-downloads/permalink/Arm-Compiler-for-Linux/Package/install.sh)
# requires Python3 (installed in base image) and glibc-devel (get through clang)
RUN yum install clang environment\
    && curl -O https://developer.arm.com/-/cdn-downloads/permalink/Arm-Compiler-for-Linux/Version_24.10.1/arm-compiler-for-linux_24.10.1_RHEL-8_aarch64.tar \
    && tar xvf arm-compiler-for-linux_24.10.1_RHEL-8_aarch64.tar \
    && cd arm-compiler-for-linux_24.10.1_RHEL-8_aarch64 \
    && ./arm-compiler-for-linux_24.10.1_RHEL-8.sh\nqyes\n \
    && cd / \
    && rm -rf arm-compiler-for-linux_24.10.1_RHEL-8_aarch64.tar arm-compiler-for-linux_24.10.1_RHEL-8_aarch64 \
    && source /etc/profile.d/modules.sh \
    && module use /opt/arm/modulefiles \
    && module load acfl/24.10.1 \
    && module load armpl/24.10.1
