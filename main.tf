# Use a random suffix to prevent overlap in network names
resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A NETWORK TO DEPLOY THE RESOURCES TO
# ---------------------------------------------------------------------------------------------------------------------

module "vpc_network" {
  source = "github.com/gruntwork-io/terraform-google-network.git//modules/vpc-network"

  name_prefix = "${var.project}-network-${var.environment}-${random_string.suffix.result}"
  project     = var.project
  region      = var.region

  cidr_block           = var.vpc_cidr_block
  secondary_cidr_block = var.vpc_secondary_cidr_block
}

module "remote_state" {
  source        = "./modules/remote_state"
  project       = var.project
  environment   = var.environment
  location      = var.region
  storage_class = var.remote_state_storage_class
  prefix        = "${var.project}-remote-state-${var.environment}-${random_string.suffix.result}"
}


module "vm" {
  source            = "git::https://github.com/nerdeveloper/terraform-google-vm.git//modules/compute_instance"
  region            = var.region
  network = module.vpc_network.network
  subnetwork        = module.vpc_network.public_subnetwork
  num_instances     = var.num_instances
  hostname          = "${var.project}-bastion-${var.environment}-${random_string.suffix.result}"
  instance_template = module.instance_template.self_link

  access_config = [{
    nat_ip       = var.nat_ip
    network_tier = var.network_tier
  }, ]
}

module "instance_template" {
  source          = "git::https://github.com/terraform-google-modules/terraform-google-vm.git//modules/instance_template"
  region          = var.region
  project_id      = var.project
  network = module.vpc_network.network
  subnetwork      = module.vpc_network.public_subnetwork
  service_account = var.bastion_service_account
  source_image_family = var.image_family
  source_image_project = var.source_image_project
  disk_size_gb = var.bastion_disk_size_gb
  tags = ["${var.project}-firewall-${var.environment}-${random_string.suffix.result}"]
  can_ip_forward = "false"
}
