resource "vultr_firewall_group" "faasd_firewall_grp" {
  description = "Allow SSH and OpenFaas ports"
}


resource "vultr_firewall_rule" "firewall_rule" {
  count             = length("${var.firewall_rules}")
  firewall_group_id = vultr_firewall_group.faasd_firewall_grp.id
  protocol          = var.firewall_rules[count.index].protocol
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = var.firewall_rules[count.index].port
  notes             = var.firewall_rules[count.index].notes
}
