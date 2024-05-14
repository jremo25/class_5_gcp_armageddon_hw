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
variable "subnet_purpose" {
  type = string
  description = "PRIVATE_RFC_1918, REGIONAL_MANAGED_PROXY, GLOBAL_MANAGED_PROXY, PRIVATE_SERVICE_CONNECT or PRIVATE_NAT."
  default = null
}

# variable "allow_rules" {
#   # rule("Allow/Deny","PROTOCOL",[LIST OF PORTS], [SOURCE CIDR RANGES])
#   type = list(tuple(string,list(string),list(string)))
# }

variable "machine_type" {
  type = string
  default = "e2-small"
}

variable "win_machine_type" {
  type = string
  default = "e2-medium"
}

variable "image" {
  type = string
  default = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
}

variable "win_image" {
  type = string
  default = "projects/windows-cloud/global/images/windows-server-2022-dc-v20240415"
}

variable "size" {
  type = number
  default = 10
}
variable "win_size" {
  type = number
  default = 50
}

 variable "enable_windows" {
  type = bool
  default = false
 }