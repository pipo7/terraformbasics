

variable "external_port" {
  default = 8000
  type    = number
}


variable "internal_port" {
  default = 81
  type    = number
}

variable "name" {
  type        = string
  default     = "k3s-test"
  description = "Name for deployment"
}

variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "nginxcontname"
}

variable "istest" {
  default = false //false
}

variable "colors" {
  default = "red" //false
}