terraform {
  backend "gcs" {
    bucket      = "ps-workspace-remote-state-dev-gloml-us-west2-first"
    prefix      = "ps-workspace-dev"
    credentials = "creds.json"


  }
}
