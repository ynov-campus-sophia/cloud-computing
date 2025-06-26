data "digitalocean_ssh_key" "sshkey" {
  name = var.pubkey
}

data "template_file" "cloud-init-yaml" {
  template = file("${path.root}/templates/${var.tpl}")
  vars = {
    init_ssh_public_key = data.digitalocean_ssh_key.sshkey.id
  }
}


import {
  to = digitalocean_vpc.network
  id = var.vpc_id
}


resource "digitalocean_vpc" "network" {
  name   = var.network_name
  region = "ams3"
  lifecycle {
    prevent_destroy = true
  }
}


resource "digitalocean_droplet" "vm" {
  image  = var.image
  name   = var.name
  region = "ams3"
  size   = var.size
  vpc_uuid = digitalocean_vpc.network.id
  user_data = data.template_file.cloud-init-yaml.rendered
  ssh_keys = [ data.digitalocean_ssh_key.sshkey.id ]
}