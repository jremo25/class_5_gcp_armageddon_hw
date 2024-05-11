#Project
variable "project_name" {
  type        = string
  description = "Deployment Name"
}

variable "region" {
  type        = string
  description = "Region Google project"
}

variable "zone" {
  type        = string
  description = "Subnet Zone"
}



# variable "project_name_eu" {
#     type = string
#     description = "Euro region project name"
# }

variable "project_name_us" {
  type        = string
  description = "US region project name"
}
variable "project_name_as" {
  type        = string
  description = "US region project name"
}

#VPC
# variable "network_name" {
#     type = string
#     description = "Project VPC Name"
# }

# Prototyping
# variable "eu_region" {
#     type= string
#     description = "Region Google project"
# }

# variable "eu_zone" {
#     type = string
#     default = "southamerica-east1-a"
# }

# US 1
variable "us_region1" {
  type        = string
  description = "US region 1"
}
variable "us_zone1" {
  type        = string
  description = "US zone 1"
}

# US 2
variable "us_region2" {
  type        = string
  description = "US region 2"
}
variable "us_zone2" {
  type        = string
  description = "US zone 2"
}

# Asia
variable "asia_region" {
  type        = string
  description = "Asia region"
}
variable "asia_zone" {
  type        = string
  description = "Asia zone"
}