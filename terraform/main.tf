provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "strapi" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name      = var.key_pair

  user_data = <<EOF
#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
docker run -d -p 1337:1337 ${var.docker_image}
EOF
}

output "public_ip" {
  value = aws_instance.strapi.public_ip
}
