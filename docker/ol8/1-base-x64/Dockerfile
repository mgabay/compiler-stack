# SPDX-License-Identifier: BSD-3-Clause
# Base image for building compilers stack based on oracle linux 8
# Additionally includes Matlab - Supported for x64 ONLY

# Include matlab image to copy it
FROM mathworks/matlab:r2023a AS matlab

FROM buildtools-base

# Install matlab
COPY --from=matlab /opt/matlab/ /opt/matlab/

# set java x86_64 version
RUN alternatives --set java java-17-openjdk.x86_64 \
    && alternatives --set javac java-17-openjdk.x86_64 \
    && wget https://github.com/ninja-build/ninja/releases/download/v1.12.1/ninja-linux.zip \
    && unzip ninja-linux.zip -d /opt/ninja \
    && rm ninja-linux.zip

# Matlab
ENV PATH="/opt/ninja:/opt/matlab/R2023a/bin/:$PATH"
