# SPDX-License-Identifier: BSD-3-Clause
# Base image for building compilers stack based on oracle linux 8
# Image for x64 systems with Intel compiler and libraries

FROM buildtools-matlab

# Repository to install Intel(R) oneAPI Libraries
RUN echo $'\
[oneAPI]\n\
name=Intel(R) oneAPI repository\n\
baseurl=https://yum.repos.intel.com/oneapi\n\
enabled=1\n\
gpgcheck=1\n\
repo_gpgcheck=1\n\
gpgkey=https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB' \
> /etc/yum.repos.d/oneAPI.repo

# Install Intel compilers and libraries
# Intel BaseKit for C and C++ compilers + MKL
# Intel HPCKit for Fortran compiler 
RUN yum update -y \
    && yum install -y intel-oneapi-compiler-fortran-2024.2 intel-oneapi-compiler-dpcpp-cpp-2024.2 intel-oneapi-mkl-devel-2024.2 \
    && yum clean all

# Much larger spread of intel tools can be installed with:
#       intel-basekit-2024.2.x86_64 intel-hpckit-2024.2.x86_64
# Intel configuration below needs to be updated for usage of additional packages

##### Environment variables #####
# Intel compiler
ENV CLASSPATH='/opt/intel/oneapi/mpi/2021.13/share/java/mpi.jar'
ENV CMAKE_PREFIX_PATH='/opt/intel/oneapi/tbb/2021.13/env/..:/opt/intel/oneapi/mkl/2024.2/lib/cmake:/opt/intel/oneapi/dpl/2022.6/lib/cmake/oneDPL:/opt/intel/oneapi/compiler/2024.2'
ENV CMPLR_ROOT='/opt/intel/oneapi/compiler/2024.2'
ENV CPATH='/opt/intel/oneapi/tbb/2021.13/env/../include:/opt/intel/oneapi/mpi/2021.13/include:/opt/intel/oneapi/mkl/2024.2/include:/opt/intel/oneapi/dpl/2022.6/include:/opt/intel/oneapi/dev-utilities/2024.2/include'
ENV DIAGUTIL_PATH='/opt/intel/oneapi/debugger/2024.2/etc/debugger/sys_check/sys_check.py:/opt/intel/oneapi/compiler/2024.2/etc/compiler/sys_check/sys_check.sh'
ENV DPL_ROOT='/opt/intel/oneapi/dpl/2022.6'
ENV FI_PROVIDER_PATH='/opt/intel/oneapi/mpi/2021.13/opt/mpi/libfabric/lib/prov:/usr/lib64/libfabric'
ENV GDB_INFO='/opt/intel/oneapi/debugger/2024.2/share/info/'
ENV INFOPATH='/opt/intel/oneapi/debugger/2024.2/share/info'
ENV INTEL_PYTHONHOME='/opt/intel/oneapi/debugger/2024.2/opt/debugger'
ENV I_MPI_ROOT='/opt/intel/oneapi/mpi/2021.13'
ENV LD_LIBRARY_PATH='/opt/intel/oneapi/tbb/2021.13/env/../lib/intel64/gcc4.8:/opt/intel/oneapi/mpi/2021.13/opt/mpi/libfabric/lib:/opt/intel/oneapi/mpi/2021.13/lib:/opt/intel/oneapi/mkl/2024.2/lib:/opt/intel/oneapi/dpl/2022.6/lib:/opt/intel/oneapi/debugger/2024.2/opt/debugger/lib:/opt/intel/oneapi/compiler/2024.2/opt/compiler/lib:/opt/intel/oneapi/compiler/2024.2/lib'
ENV LIBRARY_PATH='/opt/intel/oneapi/tbb/2021.13/env/../lib/intel64/gcc4.8:/opt/intel/oneapi/mpi/2021.13/lib:/opt/intel/oneapi/mkl/2024.2/lib/:/opt/intel/oneapi/dpl/2022.6/lib:/opt/intel/oneapi/compiler/2024.2/lib'
ENV MANPATH='/opt/intel/oneapi/mpi/2021.13/share/man:/opt/intel/oneapi/debugger/2024.2/share/man:/opt/intel/oneapi/compiler/2024.2/share/man:'
ENV MKLROOT='/opt/intel/oneapi/mkl/2024.2'
ENV NLSPATH='/opt/intel/oneapi/mkl/2024.2/share/locale/%l_%t/%N:/opt/intel/oneapi/compiler/2024.2/lib/compiler/locale/%l_%t/%N'
ENV OCL_ICD_FILENAMES='/opt/intel/oneapi/compiler/2024.2/lib/libintelocl.so'
ENV ONEAPI_ROOT='/opt/intel/oneapi'
ENV PATH='/opt/intel/oneapi/mpi/2021.13/bin:/opt/intel/oneapi/mkl/2024.2/bin/:/opt/intel/oneapi/dev-utilities/2024.2/bin:/opt/intel/oneapi/debugger/2024.2/opt/debugger/bin:/opt/intel/oneapi/compiler/2024.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
ENV PKG_CONFIG_PATH='/opt/intel/oneapi/tbb/2021.13/env/../lib/pkgconfig:/opt/intel/oneapi/mpi/2021.13/lib/pkgconfig:/opt/intel/oneapi/mkl/2024.2/lib/pkgconfig:/opt/intel/oneapi/dpl/2022.6/lib/pkgconfig:/opt/intel/oneapi/compiler/2024.2/lib/pkgconfig:'
ENV SETVARS_COMPLETED='1'
ENV TBBROOT='/opt/intel/oneapi/tbb/2021.13/env/..'

CMD ["bash"]
