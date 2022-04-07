// Configure the Google Cloud provider
provider "google" {
  credentials = file("${path.module}/creds.json") # with terraform
  #  credentials = "/Users/odirionye/Documents/terraform/hashitalks/2022/creds.json" # with Atlantis
  project = var.project
  region  = var.region
}


provider "google-beta" {
  credentials = file("${path.module}/creds.json")
  project     = var.project
  region      = var.region
}
