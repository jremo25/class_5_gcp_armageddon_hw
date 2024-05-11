variable "project_name" {
  type        = string
  description = "Deployment Name"
  default     = null
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

variable "infra_name" {
  type        = string
  description = "Name of Infrastructure"
  default     = "infra"
}

variable "public_ip" {
  type        = bool
  description = "Toggle on public ip for instances"
  default     = true
}

variable "open_ports" {
  type        = list(string)
  description = "List of ports to open"
  default     = null
}