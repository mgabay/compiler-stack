# SPDX-License-Identifier: BSD-3-Clause
# Base image for building compilers stack based on oracle linux 8
# Image with ARM compiler for ARM64 targets
FROM buildtools-base

ARG ACFL_VERS=24.10.1
ARG DIST_VERS=RHEL-8

# Interractive install through:
#   bash <(curl -L https://developer.arm.com/-/cdn-downloads/permalink/Arm-Compiler-for-Linux/Package/install.sh)
RUN yum -y install environment-modules python3 glibc-devel \
    && alternatives --set java java-17-openjdk.aarch64 \
    && alternatives --set javac java-17-openjdk.aarch64 \
    && curl -O https://developer.arm.com/-/cdn-downloads/permalink/Arm-Compiler-for-Linux/Version_${ACFL_VERS}/arm-compiler-for-linux_${ACFL_VERS}_${DIST_VERS}_aarch64.tar \
    && tar xvf arm-compiler-for-linux_${ACFL_VERS}_${DIST_VERS}_aarch64.tar \
    && cd arm-compiler-for-linux_${ACFL_VERS}_${DIST_VERS} \
    && printf "yes\n" > install.input \
    && cat install.input | ./arm-compiler-for-linux_${ACFL_VERS}_${DIST_VERS}.sh \
    && cd / \
    && rm -rf arm-compiler-for-linux_${ACFL_VERS}_${DIST_VERS}_aarch64.tar arm-compiler-for-linux_${ACFL_VERS}_${DIST_VERS} \
    && echo "source /usr/share/Modules/init/bash" >> /root/.bashenv \
    && echo "module use /opt/arm/modulefiles" >> /root/.bashenv \
    && echo "module load acfl/${ACFL_VERS}" >> /root/.bashenv \
    && echo "module load armpl/${ACFL_VERS}" >> /root/.bashenv \
    && echo "[[ -s ~/.bashenv ]] && source ~/.bashenv" >> /root/.bash_profile \
    && echo "[[ -s ~/.bashenv ]] && source ~/.bashenv" >> /root/.bashrc \
    && yum clean all

ENV BASH_ENV=/root/.bashenv

CMD ["bash"]
