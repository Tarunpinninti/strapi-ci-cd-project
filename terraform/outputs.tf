output "server_ip" {
  value = aws_instance.strapi.public_ip
}
