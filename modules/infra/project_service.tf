# Enable IAM service for project
# resource "google_project_service" "service_usage_service" {
#   project = var.project_name
#   service = "serviceusage.googleapis.com"

#   timeouts {
#     create = "5m"
#     update = "5m"
#   }
#   disable_dependent_services = true
#   disable_on_destroy         = true
# }

# resource "null_resource" "enable_service_usage_api" {
#   provisioner "local-exec" {
#     # command = "gcloud services enable iam.googleapis.com cloudresourcemanager.googleapis.com --project ${var.project}"
#     command = "gcloud services enable serviceusage.googleapis.com cloudresourcemanager.googleapis.com --project ${var.project_name}"
#   }

# #   depends_on = [google_project.project]
# }

# resource "google_project_service" "resource_manager_api" {
#   service = "cloudresourcemanager.googleapis.com"
# }

# resource "google_project_service" "iam_service" {
#   #project = var.project_name
#   service = "iam.googleapis.com"

#   timeouts {
#     create = "5m"
#     update = "5m"
#   }
# #   disable_dependent_services = true
# #   disable_on_destroy         = true
# #   depends_on = [ google_project_service.service_usage_service ]
# # depends_on = [ null_resource.enable_service_usage_api ]
#     # depends_on = [ google_project_service.resource_manager_api ]
# }

# #Enable Compute service for project

# resource "google_project_service" "compute_service" {
#   #project = var.project_name
#   service = "compute.googleapis.com"

#   timeouts {
#     create = "5m"
#     update = "5m"
#   }
# #   disable_dependent_services = true
# #   disable_on_destroy         = true
#   depends_on                 = [google_project_service.iam_service]
# }