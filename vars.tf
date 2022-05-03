variable "api_key" {
  description = "Vultr API key for create instance"
  type        = string
}

variable "os" {
  description = "Instance OS"
  type        = number
  default     = "387"
}

variable "plan" {
  description = "Vultr machine type/plan."
  type        = string
  default     = "vc2-1c-1gb"
}

variable "public_key" {
  description = "SSH Public Key for Terraform provisioner access."
  type        = string
}

variable "label" {
  description = "Vultr Server Name Labeling"
  type        = string
}

variable "region" {
  description = "Vultr Region"
  type        = string
}

variable "hostname" {
  description = "Resource hostname"
  type        = string
}

variable "domain" {
  description = "Domain name for Faasd"
  type        = string
}

variable "email" {
  description = "Email for lets encrypt"
  type        = string
}

variable "basic_auth_user" {
  description = "OpenFaas username"
  type        = string
}

variable "basic_auth_password" {
  description = "OpenFaas login password"
  type        = string
}

variable "ufw_enabled" {
  description = "Toggle UFW"
  type        = bool
}

variable "firewall_rules" {
  description = "List out the port number and protocall to allow in Firewall Rules"
  type        = "List"
  default     = [{ protocol = "tcp", port = "22", notes = "Allow SSH" }, { protocol = "tcp", port = "8080", notes = "Allow HTTP" }, { protocol = "tcp", port = "443", notes = "Allow HTTPS" }]
}
