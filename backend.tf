terraform {
  backend "gcs" {
    bucket = "ps-workspace-remote-state-dev-gloml-us-west2-first"
    prefix = "ps-workspace-dev"
    # credentials = "/Users/odirionye/Documents/terraform/hashitalks/2022/creds.json" # with atlantis
    credentials = "creds.json" // With Terraform


  }
}
