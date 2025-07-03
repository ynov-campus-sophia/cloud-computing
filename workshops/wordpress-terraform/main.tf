terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "default" {
  name = var.pubkey
}

resource "digitalocean_droplet" "wordpress-app" {
  name              = "wordpress-app"
  image             = var.image
  size   = "s-2vcpu-4gb"
  region            = var.region
  vpc_uuid          = var.vpc_id
  ssh_keys = var.ssh_keys_ids
  user_data = file("${path.root}/templates/wordpress-cloudinit.yaml")
  tags = ["wordpress", "web"]
}

resource "digitalocean_database_cluster" "wordpress-bdd" {
  name = "wordpress-bdd"
  engine     = "mysql"
  version    = "8"
  size       = "db-s-1vcpu-1gb"
  region     = var.region
  node_count = 1
  private_network_uuid = var.vpc_id
}
