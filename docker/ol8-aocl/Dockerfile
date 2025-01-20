# SPDX-License-Identifier: BSD-3-Clause
# Base image based on ubi8 and including compilers and additional build tools
# Based on Intel compilers official images

# Includ matlab image to copy it
FROM mathworks/matlab:r2024b as matlab

# Based on Oracle Linux 8. No version pinning. Using latest for security reasons.
# USE docker build --pull when building
FROM oraclelinux:8

# Install AOCL
RUN curl -O https://download.amd.com/developer/eula/aocl/aocl-5-0/aocl-linux-aocc-5.0.0.tar.gz \
    && tar xvf aocl-linux-aocc-5.0.0.tar.gz \
    && cd aocl-linux-aocc-5.0.0 \
    && ./install.sh -t /opt/aocl -i lp64 \
    && rm -rf /aocl-linux-aocc-5.0.0 aocl-linux-aocc-5.0.0.tar.gz
# Skip source /opt/aocl/5.0.0/aocc/amd-libs.cfg to load vars directly in ENV below

# Install matlab
COPY --from=matlab /opt/matlab/ /opt/matlab/

# Install compilers and tools
RUN yum-config-manager --enable ol8_codeready_builder \
    && yum-config-manager --enable ol8_addons \
    && yum update -y \
    && yum install -y \
      clang \
      cmake make ninja-build vim \
      wget git \
	    python3 java-17-openjdk-devel maven R \
      python3-sphinx texlive \
      texlive-anyfontsize texlive-dvipng texlive-fncychap texlive-titlesec texlive-tabulary texlive-framed texlive-wrapfig texlive-upquote texlive-needspace texlive-capt-of \
    && pip3 install numpydoc \
    && /usr/sbin/alternatives --set python /usr/bin/python3 \
    && alternatives --set java java-17-openjdk.x86_64 \
    && alternatives --set javac java-17-openjdk.x86_64 \
    && yum clean all

##### Environment variables #####
# General
ENV LANG=C.UTF-8

# AOCL Paths
ENV AOCL_ROOT="/opt/aocl/5.0.0/aocc"
ENV C_INCLUDE_PATH="/opt/aocl/5.0.0/aocc/include:$C_INCLUDE_PATH"
ENV CPLUS_INCLUDE_PATH="/opt/aocl/5.0.0/aocc/include:$CPLUS_INCLUDE_PATH"
ENV LD_LIBRARY_PATH="/opt/aocl/5.0.0/aocc/lib:$LD_LIBRARY_PATH"
ENV LIBRARY_PATH="/opt/aocl/5.0.0/aocc/lib:$LIBRARY_PATH"

# Matlab
ENV PATH="$PATH:/opt/matlab/R2024b/bin/"

# Java
ENV JAVA_HOME="/usr/lib/jvm/java-17"