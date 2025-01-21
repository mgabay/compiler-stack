# SPDX-License-Identifier: BSD-3-Clause
# Base image for building compilers stack based on oracle linux 8
# Image for x64 systems with AMD compiler and libraries

FROM buildtools-matlab

# Install AOCL
RUN curl -O https://download.amd.com/developer/eula/aocl/aocl-5-0/aocl-linux-aocc-5.0.0.tar.gz \
    && tar xvf aocl-linux-aocc-5.0.0.tar.gz \
    && cd aocl-linux-aocc-5.0.0 \
    && ./install.sh -t /opt/aocl -i lp64 \
    && rm -rf /aocl-linux-aocc-5.0.0 aocl-linux-aocc-5.0.0.tar.gz
# Skip source /opt/aocl/5.0.0/aocc/amd-libs.cfg to load vars directly in ENV below

# Install clang and clean yum
RUN yum install -y clang \
    && yum clean all

##### Environment variables #####
# AOCL Paths
ENV AOCL_ROOT="/opt/aocl/5.0.0/aocc"
ENV C_INCLUDE_PATH="/opt/aocl/5.0.0/aocc/include:$C_INCLUDE_PATH"
ENV CPLUS_INCLUDE_PATH="/opt/aocl/5.0.0/aocc/include:$CPLUS_INCLUDE_PATH"
ENV LD_LIBRARY_PATH="/opt/aocl/5.0.0/aocc/lib:$LD_LIBRARY_PATH"
ENV LIBRARY_PATH="/opt/aocl/5.0.0/aocc/lib:$LIBRARY_PATH"
