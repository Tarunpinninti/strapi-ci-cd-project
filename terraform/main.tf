#########################################
# SECURITY GROUP
#########################################

resource "aws_security_group" "strapi_sg" {
  name        = "strapi-security-group"
  description = "Allow Strapi (1337) and SSH (22)"

  ingress {
    description = "Allow Strapi"
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#########################################
# EC2 INSTANCE
#########################################

resource "aws_instance" "strapi_server" {
  ami           = "ami-08a52ddb321b32a8c" # Amazon Linux 2023
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.strapi_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y docker
    systemctl start docker
    systemctl enable docker
    usermod -aG docker ec2-user

    docker pull ${var.docker_image}

    docker stop strapi || true
    docker rm strapi || true

    docker run -d \
      --name strapi \
      -p 1337:1337 \
      ${var.docker_image}
  EOF

  tags = {
    Name = "Strapi-EC2-Server"
  }
}

#########################################
# OUTPUTS
#########################################

output "strapi_url" {
  value = "http://${aws_instance.strapi_server.public_ip}:1337"
}

