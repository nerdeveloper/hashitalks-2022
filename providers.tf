// Configure the Google Cloud provider
provider "google" {
  credentials = file("${path.module}/creds.json")
  project     = var.project
  region      = var.region
}


provider "google-beta" {
  credentials = file("${path.module}/creds.json")
  project     = var.project
  region      = var.region
}
