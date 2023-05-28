
output "pbkey" {
  value = tls_private_key.admin.public_key_openssh
}

output "prvtkey" {
  value     = tls_private_key.admin.private_key_openssh
  sensitive = true
}


output "containerports" {
  value = docker_container.nginx.ports
}

output "containerhostname" {
  value = docker_container.nginx.hostname
}

output "datetimestamp" {
  value = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp()) // out put the value of time of creation as per format
}

