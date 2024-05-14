output "bucket_link" {
    value = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/index.html"
}

output "ip_addresses" {
  value = <<EOF
    *********************
    Private IP Addresses:
    ********************* 
    EU server:     ${module.infra-eu.internal}
    US server 1:   ${module.infra-us-1.internal}
    US server 2:   ${module.infra-us-2.internal}
    Asia server:   ${module.infra-asia.internal}
    EOF
}

output "urls" {
  value = <<EOF
    *********************
    Public IP Addresses:
    ********************* 
    EU server:     ${module.infra-eu.url}
    US server 1:   ${module.infra-us-1.url}
    US server 2:   ${module.infra-us-2.url}
    Asia server:   ${module.infra-asia.url}
    EOF
}

output "connect_cmds" {
  value = <<-EOT
  *********************
  Connection bash commands
  *********************
  US server 1:   gcloud compute ssh --zone "${module.infra-us-1.zone}" "${module.infra-us-1.instance_name}" --project "${module.infra-us-1.project}"
  US server 2:   gcloud compute ssh --zone "${module.infra-us-2.zone}" "${module.infra-us-2.instance_name}" --project "${module.infra-us-2.project}"
  ASIA SSH:   gcloud compute ssh --zone "${module.infra-asia.zone}" "${module.infra-asia.instance_name}" --project "${module.infra-asia.project}"
 
  EOT
}
output "windows_rdp" {
  value = module.infra-asia.windows_rdp
}