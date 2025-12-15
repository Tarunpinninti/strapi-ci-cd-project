variable "docker_image" {
  description = "Docker image for Strapi"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "strapi-key"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
