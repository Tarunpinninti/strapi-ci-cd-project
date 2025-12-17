#########################################
# DATA: EXISTING SECURITY GROUP
#########################################

data "aws_security_group" "strapi_sg" {
  name = "strapi-security-group"
}

#########################################
# EC2 INSTANCE
#########################################

resource "aws_instance" "strapi_server" {
  ami           = "ami-08a52ddb321b32a8c" # Amazon Linux 2023
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    data.aws_security_group.strapi_sg.id
  ]

  user_data = <<-EOF
    #!/bin/bash
    set -e

    dnf update -y
    dnf install -y docker

    systemctl start docker
    systemctl enable docker

    usermod -aG docker ec2-user

    # Wait for Docker
    sleep 10

    # Pull PUBLIC image
    docker pull tarunpinninti/strapi:9668afc82bc284e53db422c0ac017dcf859e4a2b

    docker stop strapi || true
    docker rm strapi || true

    docker run -d \
      --name strapi \
      -p 1337:1337 \
      -e HOST=0.0.0.0 \
      tarunpinninti/strapi:9668afc82bc284e53db422c0ac017dcf859e4a2b
  EOF

  tags = {
    Name = "Strapi-EC2-Server"
  }
}

#########################################
# OUTPUT
#########################################

output "strapi_url" {
  value = "http://${aws_instance.strapi_server.public_ip}:1337"
}
