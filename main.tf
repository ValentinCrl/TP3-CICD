data "openstack_images_image_v2" "ubuntu" {
  name        = "ubuntu 22.04"
  most_recent = true
}

resource "openstack_networking_secgroup_v2" "web" {
  name        = "sg-web-${var.author}"
  description = "SG pour serveurs web : HTTP, HTTPS, SSH restreint"
}

# Règle HTTP (80) — ouvert à tous
resource "openstack_networking_secgroup_rule_v2" "http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = var.my_ip
  security_group_id = openstack_networking_secgroup_v2.web.id
}

# Règle HTTPS (443) — ouvert à tous
resource "openstack_networking_secgroup_rule_v2" "https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = var.my_ip
  security_group_id = openstack_networking_secgroup_v2.web.id
}

# Règle SSH (22) — UNIQUEMENT depuis votre IP
resource "openstack_networking_secgroup_rule_v2" "ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.my_ip
  security_group_id = openstack_networking_secgroup_v2.web.id
}

# ─── INSTANCE OVHcloud ───────────────────────────────────────────────────────
resource "openstack_compute_instance_v2" "web" {
  name        = "web-securise-${var.author}"
  flavor_name = "d2-2"
  image_id    = data.openstack_images_image_v2.ubuntu.id
  region      = var.region

  security_groups = [openstack_networking_secgroup_v2.web.name]

  network {
    name = "Ext-Net"
  }
}






