terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_vpc" "network_vpc" {
  name     = var.name
  region   = "ams3"
  ip_range = var.cidr
}
