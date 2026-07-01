provider "ovh" {
  endpoint = "ovh-eu"
}

# Provider OpenStack : Security Groups, règles réseau (Neutron)
provider "openstack" {
  auth_url = "https://auth.cloud.ovh.net/v3"
  region   = var.region
  # Credentials via RC file sourcé : OS_USERNAME, OS_PASSWORD, etc.
}
