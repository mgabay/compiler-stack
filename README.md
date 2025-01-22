# Compiler Stack
[![Build Status](https://github.com/mgabay/compiler-stack/actions/workflows/docker-image.yml/badge.svg)](https://github.com/mgabay/compiler-stack/actions)

Platform specific compiler stack comprising compilers and all build dependencies for various builds.

All builds are based on Oracle Linux 8 (RHEL 8) and include:
- C, C++, Fortran compilers (optimized for target platform)
- Java 17
- Python 3
- R
- Latex (and a few extras)
- Sphinx documentation generator
- Build tools: make, cmake, ninja, maven

In addition, x86_64 also includes Matlab (for building binary MEX)

C/C++ and Fortran compilers used are:
- [Intel oneapi (clang-based) compilers](https://www.intel.com/content/www/us/en/developer/tools/oneapi/dpc-compiler.html) for x64 architecture and Intel targets
- [AOCC compilers](https://www.amd.com/fr/developer/aocc.html) for x64 architecture and AMD targets
- [ARM Compiler for Linux](https://developer.arm.com/Tools%20and%20Software/Arm%20Compiler%20for%20Linux#Downloads) (ACFL) or linux/arm64 architecture
  - Nb: ARM will move to Arm Toolchain for Linux (ATfL) in near future

Performance libraries (for BLAS):
- [Intel MKL](https://www.intel.com/content/www/us/en/developer/tools/oneapi/onemkl.html) on Intel x64 platforms
- [AMD Optimizing CPU Libraries](https://www.amd.com/fr/developer/aocl.html) on AMD x64 platforms
- [ARM Performance Libraries](https://developer.arm.com/Tools%20and%20Software/Arm%20Performance%20Libraries) on linux/x64 platforms
