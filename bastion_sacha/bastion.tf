resource "digitalocean_droplet" "bastion" {
  image    = var.image
  name     = "bastion-${var.name}-${var.region}"
  region   = var.region
  size     = "s-1vcpu-1gb"
  ssh_keys = var.ssh_keys_ids
  vpc_uuid = data.digitalocean_vpc.web.id
  tags     = ["${var.name}-webserver"]
  lifecycle {
    create_before_destroy = true
  }
}

resource "digitalocean_firewall" "bastion" {
  name        = "${var.name}-only-ssh-bastion"
  droplet_ids = [digitalocean_droplet.bastion.id]
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "22"
    destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }
}