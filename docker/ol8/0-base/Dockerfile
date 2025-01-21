# SPDX-License-Identifier: BSD-3-Clause
# Base image for building compilers stack based on oracle linux 8
# Common for x64 and ARM architectures

# Based on Oracle Linux 8. No version pinning. Using latest for security reasons.
# USE docker build --pull when building
FROM oraclelinux:8

# Enables additional repositories and install base tools
RUN yum-config-manager --enable ol8_codeready_builder \
    && yum-config-manager --enable ol8_addons \
    && yum update -y \
    && yum install -y \
      cmake make ninja-build vim \
      wget git \
	    python3 java-17-openjdk-devel maven R \
      python3-sphinx texlive \
      texlive-anyfontsize texlive-dvipng texlive-fncychap texlive-titlesec texlive-tabulary texlive-framed texlive-wrapfig texlive-upquote texlive-needspace texlive-capt-of \
    && pip3 install numpydoc \
    && /usr/sbin/alternatives --set python /usr/bin/python3 \
    && alternatives --set java java-17-openjdk.x86_64 \
    && alternatives --set javac java-17-openjdk.x86_64

##### Environment variables #####
# General
ENV LANG=C.UTF-8

# Java
ENV JAVA_HOME="/usr/lib/jvm/java-17"
