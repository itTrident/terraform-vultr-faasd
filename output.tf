output "gateway_url" {
  description = "The url of the faasd gateway"
  value       = var.domain == null || var.domain == "" ? format("http://%s:8080", vultr_instance.faasd_instance.main_ip) : format("https://%s", var.domain)
}

output "user_name" {
  value = var.basic_auth_user
}

output "password" {
  sensitive = true
  value     = local.basic_auth_password
}

output "instance_ip" {
  value = vultr_instance.faasd_instance.main_ip
}