resource "google_storage_bucket" "auto-expire" {
  name          = "iac-terra"
  project = "iac-terra"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}