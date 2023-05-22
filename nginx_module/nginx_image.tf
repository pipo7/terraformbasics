terraform {
  required_providers {
    mydocker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0" // this is given provider version
    }
  }
}

// Empty provider block has been deprecated
# provider "mydocker" {
# }

resource "docker_image" "nginx2" {
  provider = mydocker // you can specify like this
  name         = "nginx"
  keep_locally = true
}