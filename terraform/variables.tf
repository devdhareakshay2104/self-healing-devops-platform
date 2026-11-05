
variable "aws_region" {
  description = "AWS region for infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "AWS Availability Zone"
  type        = string
  default     = "us-east-1a"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "self-healing-platform"
}

variable "ssh_allowed_cidr" {
  description = "Your public IP address with /32"
  type        = string
}
variable "ami_id" {
  description = "Ubuntu 24.04 LTS AMI ID"
  type        = string
}