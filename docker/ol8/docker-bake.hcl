variable "VERSION" {
  default = "2024.2.0"
}

variable "TAG" {
  default = "2024.2"
}

target "base" {
    dockerfile = "./0-base/Dockerfile"
    platforms = ["linux/amd64","linux/arm64"]
}

target "x64-base" {
    dockerfile = "./1-base-x64/Dockerfile"
    contexts = {
        buildtools-base = "target:base"
    }
    platforms = ["linux/amd64"]
}

target "x64-amd" {
    dockerfile = "./2-x64-aocl/Dockerfile"
    contexts = {
        buildtools-matlab = "target:x64-base"
    }
    tags = ["docker.io/mgabay/compiler-stack:${TAG}-amd64","docker.io/mgabay/compiler-stack:${VERSION}-amd64"]
    platforms = ["linux/amd64"]
}

target "x64-intel" {
    dockerfile = "./2-x64-intel/Dockerfile"
    contexts = {
        buildtools-matlab = "target:x64-base"
    }
    tags = ["docker.io/mgabay/compiler-stack:${TAG}-intel64","docker.io/mgabay/compiler-stack:${VERSION}-intel64","docker.io/mgabay/compiler-stack:latest"]
    platforms = ["linux/amd64"]
}

target "arm64-acfl" {
    dockerfile = "./2-arm64-acfl/Dockerfile"
    contexts = {
        buildtools-base = "target:base"
    }
    tags = ["docker.io/mgabay/compiler-stack:${TAG}-arm64","docker.io/mgabay/compiler-stack:${VERSION}-arm64"]
    platforms = ["linux/arm64"]
}
