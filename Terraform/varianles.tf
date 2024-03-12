variable "cloudinit_template_name" {
    type = string
}

variable "proxmox_node" {
    type = string
}

variable "ssh_key" {
  type = string
  sensitive = true
}

##################################################################################
# LOCALS
##################################################################################

locals {
  buildtime = formatdate("MM-DD-YYYY hh:mm ZZZ", timestamp())
}
