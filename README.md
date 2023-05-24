# Usage

terraform plan 

# Templates
Run the following command to use backends.tftpl 
it renders to general file, JSON and a YAML output as given in backends.tftpl

templatefile("${path.module}/backends.tftpl", { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"] })


