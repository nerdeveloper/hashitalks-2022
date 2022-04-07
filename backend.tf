terraform {
  backend "gcs" {
    bucket      = "ps-workspace-remote-state-dev-b6739-us-west2-first"
    prefix      = "ps-workspace-dev"
    credentials = "creds.json"
    #    credentials = "/Users/odirionye/Documents/terraform/hashitalks/2022/creds.json"

  }
}
