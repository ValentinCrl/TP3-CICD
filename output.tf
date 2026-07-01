output "instance_ip" {
  value = openstack_compute_instance_v2.web.access_ip_v4
}

output "instance_name" {
  value = openstack_compute_instance_v2.web.name
}

output "secgroup_name" {
  value = openstack_networking_secgroup_v2.web.name
}

