variable "bastion_zone" {
  type    = string
  default = "us-west2-a"
}

variable "image_family" {
  type    = string
  default = "ubuntu-1804-lts"
}

variable "bastion_disk_size_gb" {
  type    = string
  default = "50"
}

variable "bastion_service_account" {
  default = {

    email  = "tobi-lab-sa@ps-workspace.iam.gserviceaccount.com",
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
  type = object({
    email  = string,
    scopes = set(string)
  })
  description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#service_account."
}

variable "num_instances" {
  type    = string
  default = "1"
}

variable "nat_ip" {
  description = "Public ip address"
  default     = null
}

variable "network_tier" {
  description = "Network network_tier"
  default     = "PREMIUM"
}

variable "source_image_project" {
  description = "Machine type for the instance"
  default     = "ubuntu-os-cloud"
}
