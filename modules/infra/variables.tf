variable "project_name" {
  type = string
  description = "Deployment Name"
}

variable "region" {
    type= string
    description = "Region Google project"
}

variable "zone" {
    type = string
    description = "Subnet Zone"
}

variable "subnet_cidr" {
    type = string
    description = "Subnet CIDR block"
}

# variable "vpc_id" {
#     type = string
#     description = "VPC ID"
# }