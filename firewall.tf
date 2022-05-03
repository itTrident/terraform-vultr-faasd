resource "vultr_firewall_group" "faasd_firewall_grp" {
  description = "Allow SSH and OpenFaas ports"
}

resource "vultr_firewall_rule" "allow_ssh" {
  firewall_group_id = vultr_firewall_group.faasd_firewall_grp.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "22"
  notes             = "Allow SSH"
}

resource "vultr_firewall_rule" "allow_http" {
  firewall_group_id = vultr_firewall_group.faasd_firewall_grp.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "8080"
  notes             = "Allow HTTP"
}

#resource "vultr_firewall_rule" "allow_prometheus" {
#  firewall_group_id = vultr_firewall_group.faasd_firewall_grp.id
#  protocol          = "tcp"
#  ip_type           = "v4"
#  subnet            = "0.0.0.0"
#  subnet_size       = 0
#  port              = "9090"
#  notes             = "Allow Prometheus"
#}

resource "vultr_firewall_rule" "allow_https" {
  firewall_group_id = vultr_firewall_group.faasd_firewall_grp.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "443"
  notes             = "Allow HTTPS"
}
