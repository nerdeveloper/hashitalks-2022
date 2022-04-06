variable "backend_output_path" {
  default     = "./backend.tf"
  description = "The default file to output backend configuration to"
}
variable "project" {
  type = string
  default = ""

}
variable "environment" {
  type = string
  default = ""

}
variable "prefix" {
  type = string
  default = ""
}
variable "location" {
  type = string
  default = ""
}

variable "storage_class" {
  type = string
  default = "REGIONAL"
}
