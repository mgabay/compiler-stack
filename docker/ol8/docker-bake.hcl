variable "VERSION" {
  default = "2024.2.1"
}

variable "TAG" {
  default = "2024.2"
}

variable "NIGHTLY" {
  default = false
}

variable "IMG_NAME" {
  default = "docker.io/mgabay/compiler-stack"
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
    tags = [
        NIGHTLY ? "${IMG_NAME}:amd64-nightly" : "",
        not(NIGHTLY) ? "${IMG_NAME}:${TAG}-amd64" : "",
        not(NIGHTLY) ? "${IMG_NAME}:${VERSION}-amd64" : ""
    ]
    platforms = ["linux/amd64"]
}

target "x64-intel" {
    dockerfile = "./2-x64-intel/Dockerfile"
    contexts = {
        buildtools-matlab = "target:x64-base"
    }
    tags = [
        NIGHTLY ? "${IMG_NAME}:intel64-nightly" : "",
        not(NIGHTLY) ? "${IMG_NAME}:${TAG}-intel64" : "",
        not(NIGHTLY) ? "${IMG_NAME}:${VERSION}-intel64" : "",
        not(NIGHTLY) ? "${IMG_NAME}:latest" : ""
    ]
    platforms = ["linux/amd64"]
}

target "arm64-acfl" {
    dockerfile = "./2-arm64-acfl/Dockerfile"
    contexts = {
        buildtools-base = "target:base"
    }
    tags = [
        NIGHTLY ? "${IMG_NAME}:arm64-nightly" : "",
        not(NIGHTLY) ? "${IMG_NAME}:${TAG}-arm64" : "",
        not(NIGHTLY) ? "${IMG_NAME}:${VERSION}-arm64" : ""
    ]
    platforms = ["linux/arm64"]
}
