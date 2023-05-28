# Usage

terraform plan 

# Templates
Run the following command to use backends.tftpl 
it renders to general file, JSON and a YAML output as given in backends.tftpl

templatefile("${path.module}/backends.tftpl", { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"] })

# key values
NOTE: 
actual and senstivie values are in terraform.tfvars file that is .gitignore
external_port = <>
internal_port = 80
host = "10.xxx.xx236"
user_password= <>
