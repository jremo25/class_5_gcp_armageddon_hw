variable "project_name" {
  type        = string
  description = "Deployment Name"
  default = null
}

variable "region" {
  type        = string
  description = "Region Google project"
}

variable "zone" {
  type        = string
  description = "Subnet Zone"
}

variable "subnet_cidr" {
  type        = string
  description = "Subnet CIDR block"
}

variable "vpc_name" {
  type = string
  description = "Name of VPC"
  default = "vpc"
}

# variable "vpc_id" {
#     type = string
#     description = "VPC ID"
# }

variable "public_ip" {
  type = bool
  description = "Toggle on public ip for instances"
  default = true
}