variable "docker_image" {
  description = "Docker image for Strapi"
  type        = string
}

variable "key_pair" {
  description = "EC2 key pair name"
  type        = string
  default     = "strapi-key"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

