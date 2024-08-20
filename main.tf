resource "google_storage_bucket" "auto-expire" {
  name          = "iac-terra"
  project       = "iac-terra"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}

# make new object public

resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.static_site_src.name
  bucket = google_storage_bucket.website.name
  role = "READER"
  entity = "allUsers"
}

# upload html to bucket

resource "google_storage_bucket_object" "static_site_src" {
  name = "index.html"
  source = "../website/index.html"
  bucket = google_storage_bucket.website.name
}
