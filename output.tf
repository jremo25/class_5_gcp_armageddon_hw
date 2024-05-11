output "ip_addresses" {
  value = <<EOF
    *********************
    Private IP Addresses:
    ********************* 
    EU server: ${module.infra-eu.internal}
    US server 1: ${module.infra-us-1.internal}
    US server 2: ${module.infra-us-2.internal}
    Asia server: ${module.infra-asia.internal}
    EOF
}

output "urls" {
  value = <<EOF
    *********************
    Public IP Addresses:
    ********************* 
    EU server: ${module.infra-eu.url}
    US server 1: ${module.infra-us-1.url}
    US server 2: ${module.infra-us-2.url}
    Asia server: ${module.infra-asia.url}
    EOF
}