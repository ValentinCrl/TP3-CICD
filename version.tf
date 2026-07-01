terraform {
  required_version = ">= 1.15.7"
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 2.15"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 3.4.0"
    }
  }
}
