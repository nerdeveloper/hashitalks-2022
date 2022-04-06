module "remote_state" {
  source  = "terraform-google-modules/cloud-storage/google"
  project_id  = var.project
  location = var.location
  names = ["first"]
  force_destroy = {
    first = true
  }
  storage_class = var.storage_class
  prefix = var.prefix
  versioning = {
    first = true
  }
}


#-------------------------------------------------------
# AUTOMATING REMOTE STATE
#-------------------------------------------------------
data "template_file" "remote_state" {
  template = file("${path.module}/templates/remote_state.tpl")
  vars = {
    bucket_name  = module.remote_state.name
    prefix_name = "${var.project}-${var.environment}"
    credentials_config = "creds.json"

  }
}

resource "null_resource" "remote_state_locks" {
  provisioner "local-exec" {
    command = "sleep 20;cat > ${var.backend_output_path}<<EOL\n${data.template_file.remote_state.rendered}"
  }
  depends_on = [module.remote_state]
}
