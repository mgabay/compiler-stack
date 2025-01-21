# SPDX-License-Identifier: BSD-3-Clause
# Base image for building compilers stack based on oracle linux 8
# Additionally includes Matlab - Supported for x64 ONLY

# Includ matlab image to copy it
FROM mathworks/matlab:r2024b as matlab

FROM buildtools-base

# Install matlab
COPY --from=matlab /opt/matlab/ /opt/matlab/

# Matlab
ENV PATH="$PATH:/opt/matlab/R2024b/bin/"
