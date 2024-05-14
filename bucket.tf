resource "random_string" "password" {
    length = 8
    special = false
    upper = false
}

resource "google_storage_bucket" "bucket" {
  name          = "arma-bucket-${random_string.password.result}"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 30
    }
  }
}

resource "google_storage_bucket_iam_binding" "public_bucket" {
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers"
  ]
}

locals {
  content_types = {
    ".html" : "text/html",
    ".css" : "text/css",
    ".js" : "text/javascript",
    ".mp4" : "video/mp4",
    ".png" : "image/png"
  }
}

resource "google_storage_bucket_object" "file" {
  for_each     = fileset(path.module, "content/**/*.{html,css,js,mp4,png}")
  bucket       = google_storage_bucket.bucket.id
#   key          = replace(each.value, "/^content//", "")
  name          = replace(each.value, "/^content//", "")
  source       = each.value
  content_type = lookup(local.content_types, regex("\\.[^.]+$", each.value), null)
#   etag         = filemd5(each.value)
    detect_md5hash = true
}

# resource "google_storage_bucket_object" "upload_html" {
#   for_each     = fileset("${path.module}/content/", "*.html")
#   bucket       = google_storage_bucket.bucket.name
#   name         = each.value
#   source       = "${path.module}/content/${each.value}"
#   content_type = "text/html"
# }

