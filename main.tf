terraform {
  backend "local" { // Specify that backend is local or remote such as S3, etc.
  }
  // this is terraform version
  required_version ="<=1.4.6"  // use >1.4.6 it will give error as on this VM the version is 1.4.6
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0" // this is given provider version
    }
  }
}

provider "docker" {
  alias = "mydocker" // use in case you have multiple similar providers but you want to differentiate
}

provider "docker" {
  alias = "mydocker2" // use in case you have multiple similar providers but you want to differentiate
}

locals {
  name_prefix               = "${var.name}"
  ssh_key_prefix_with_path  = "${path.module}/${local.name_prefix}-generated-ssh"
  common_tags = {
    owner = "devops"
    service = "frontend"
  }
}

# //example of how to use a module
 module "nginx_module" {
   source = "./nginx_module" 
    }

resource "docker_image" "nginx" {
  provider = docker.mydocker // you can specify like this
  name         = "nginx"
  keep_locally = false
  
}

resource "docker_container" "nginx" {
  provider = docker.mydocker2 // you can specify like this
  image = docker_image.nginx.image_id #docker_image.nginx.image_id
  name  = var.container_name!=""? var.container_name: "default-a"
  ports {
    internal = var.internal_port
    external = var.external_port
  }
  
}

resource "tls_private_key" "admin" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "admin-private-key" {
  content    = tls_private_key.admin.private_key_pem
  filename = "${local.ssh_key_prefix_with_path}.key"
  file_permission = "0600"
}

resource "null_resource" "provision-agent" { 
  provisioner "local-exec" {
    when = destroy
    command = <<EOT
    echo "hello world the resource provision-agent has been destroyed " 
    EOT
    on_failure = fail // fail  if the provisioner fails
  }
 
  
}

# dynamic "test" {
#   for_each = var.colors
#   iterator = color
#   content  {
#     value = color.value
#   }
# }

// creates 3 times and we use as index for name
resource "null_resource" "checkcounts" {
  count = var.istest == true ? 2 : 3
}


resource "null_resource" "the-accounts" {
  for_each = toset( ["Todd", "James", "Alice", "Dottie"] )
}

resource "null_resource" "rg" {
  for_each = {
    a_group = "eastus"
    another_group = "westus2"
  }
  
}
