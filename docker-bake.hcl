variable "OWNER" {
  default = "visualon"
}
variable "FILE" {
  default = "renovate"
}
variable "TAG" {
  default = "latest"
}
variable "VERSION" {
  default = ""
}

group "default" {
  targets = ["build_ghcr", "build_docker"]
}

group "build" {
  targets = ["build_ghcr", "build_docker", "push_ghcr"]
}

group "push" {
  targets = ["push_ghcr"]
}

group "test" {
  targets = ["build_docker"]
}

target "settings" {
  cache-from = [
    "type=registry,ref=ghcr.io/${OWNER}/cache:${FILE}",
    "type=registry,ref=ghcr.io/${OWNER}/cache:${FILE}-${TAG}",
    "type=registry,ref=ghcr.io/${OWNER}/cache:${FILE}-${VERSION}",
  ]
}

target "build_ghcr" {
  inherits = ["settings"]
  output   = ["type=registry"]
  tags     = [
    "ghcr.io/${OWNER}/cache:${FILE}-${TAG}",
    notequal("", VERSION) ? "ghcr.io/${OWNER}/cache:${FILE}-${VERSION}" : "",
  ]
  cache-to = ["type=inline,mode=max"]
}

target "build_docker" {
  inherits = ["settings"]
  output   = ["type=docker"]
  tags     = [
    "ghcr.io/${OWNER}/${FILE}:${TAG}",
    notequal("", VERSION) ? "ghcr.io/${OWNER}/${FILE}:${VERSION}" : "",
  ]
}

target "push_ghcr" {
  inherits = ["settings"]
  output   = ["type=registry"]
  tags     = [
    "ghcr.io/${OWNER}/${FILE}:${TAG}",
    notequal("", VERSION) ? "ghcr.io/${OWNER}/${FILE}:${VERSION}" : "",
  ]
}
