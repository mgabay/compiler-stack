# SPDX-License-Identifier: BSD-3-Clause
# Base image for building compilers stack based on oracle linux 8
# Image for x64 systems with AMD compiler and libraries

FROM buildtools-matlab

# Install AOCL and AOCC
RUN yum install -y https://download.amd.com/developer/eula/aocl/aocl-5-0/aocl-linux-aocc-5.0.0-1.x86_64.rpm \
    && yum install -y https://download.amd.com/developer/eula/aocc/aocc-5-0/aocc-compiler-5.0.0-1.x86_64.rpm \
    && cd /opt/AMD/aocl/aocl-linux-aocc-5.0.0/aocc \
    && bash set_aocl_interface_symlink.sh lp64 \
    && yum clean all
# Skip sourcing amd-libs.cfg to load vars directly in ENV below

##### Environment variables #####
# AOCL Paths
ENV LD_LIBRARY_PATH="/opt/AMD/aocl/aocl-linux-aocc-5.0.0/aocc/lib:$LD_LIBRARY_PATH"
ENV LIBRARY_PATH="/opt/AMD/aocl/aocl-linux-aocc-5.0.0/aocc/lib:$LIBRARY_PATH"
ENV C_INCLUDE_PATH="/opt/AMD/aocl/aocl-linux-aocc-5.0.0/aocc/include:$C_INCLUDE_PATH"
ENV C_PLUS_INCLUDE_PATH="/opt/AMD/aocl/aocl-linux-aocc-5.0.0/aocc/include:$C_PLUS_INCLUDE_PATH"
ENV AOCL_ROOT="/opt/AMD/aocl/aocl-linux-aocc-5.0.0/aocc"


# AOCC Paths
ENV PATH="/opt/AMD/aocc-compiler-5.0.0/bin:/opt/AMD/aocc-compiler-5.0.0/share/opt-viewer:$PATH"
ENV LIBRARY_PATH="/opt/AMD/aocc-compiler-5.0.0/lib:/opt/AMD/aocc-compiler-5.0.0/lib32:/usr/lib/x86_64-linux-gnu:/usr/lib64:/usr/lib32:/usr/lib:$LIBRARY_PATH"
ENV LD_LIBRARY_PATH="/opt/AMD/aocc-compiler-5.0.0/ompd:/opt/AMD/aocc-compiler-5.0.0/lib:/opt/AMD/aocc-compiler-5.0.0/lib32:/usr/lib/x86_64-linux-gnu:/usr/lib64:/usr/lib32:/usr/lib:$LD_LIBRARY_PATH"
ENV C_INCLUDE_PATH="/opt/aocl/5.0.0/aocc/include/opt/AMD/aocc-compiler-5.0.0/include:$C_INCLUDE_PATH"
ENV CPLUS_INCLUDE_PATH="/opt/aocl/5.0.0/aocc/include:/opt/AMD/aocc-compiler-5.0.0/include:$CPLUS_INCLUDE_PATH"
ENV LIBRARY_PATH="/usr/lib64:/usr/lib:$LIBRARY_PATH"
ENV LD_LIBRARY_PATH="/usr/lib64:/usr/lib:$LD_LIBRARY_PATH"

CMD ["bash"]
