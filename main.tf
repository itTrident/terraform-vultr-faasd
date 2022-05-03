locals {
  generate_password   = var.basic_auth_password == null || var.basic_auth_password == ""
  basic_auth_user     = var.basic_auth_user
  basic_auth_password = local.generate_password ? random_password.faasd[0].result : var.basic_auth_password

  user_data_vars = {
    basic_auth_user     = local.basic_auth_user
    basic_auth_password = local.basic_auth_password
    domain              = var.domain
    email               = var.email
    ufw_enabled         = var.ufw_enabled
  }
}

resource "random_password" "faasd" {
  count            = local.generate_password ? 1 : 0
  length           = 16
  special          = true
  override_special = "_-#"
}

resource "vultr_ssh_key" "faasd_ssh_key" {
  name    = "faasd_ssh"
  ssh_key = file(var.public_key)
}

resource "vultr_instance" "faasd_instance" {
  plan              = var.plan
  region            = var.region
  os_id             = var.os
  label             = var.label
  hostname          = var.hostname
  ssh_key_ids       = ["${vultr_ssh_key.faasd_ssh_key.id}"]
  user_data         = templatefile("${path.module}/template/startup.sh", local.user_data_vars)
  firewall_group_id = vultr_firewall_group.faasd_firewall_grp.id
}