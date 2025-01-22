# SPDX-License-Identifier: BSD-3-Clause
# Base image for building compilers stack based on oracle linux 8
# Common for x64 and ARM architectures

# Based on Oracle Linux 8. No version pinning. Using latest for security reasons.
# USE docker build --pull when building
FROM oraclelinux:8

# Enables additional repositories and install base tools
RUN yum-config-manager --enable ol8_codeready_builder \
    && yum update -y \
    && yum install -y oracle-epel-release-el8 \
    && yum install -y \
      cmake make ninja-build vim \
      wget git \
	    python3 java-17-openjdk-devel maven R \
      python3-sphinx texlive \
      texlive-anyfontsize texlive-dvipng texlive-fncychap texlive-titlesec texlive-tabulary texlive-framed texlive-wrapfig texlive-upquote texlive-needspace texlive-capt-of \
    && yum clean all \
    && pip3 install numpydoc \
    && /usr/sbin/alternatives --set python /usr/bin/python3
# Get R through oracle-epel-release-el8 instead of ol8_addons which only supports x86
# Java version is set in architecture specific Dockerfiles through alternatives

##### Environment variables #####
# General
ENV LANG=C.UTF-8

# Java
ENV JAVA_HOME="/usr/lib/jvm/java-17"
# Also need to set alternatives for java and javac in architecture specific files
