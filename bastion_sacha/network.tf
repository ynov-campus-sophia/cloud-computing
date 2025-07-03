data "digitalocean_vpc" "web" {
  id        = var.vpc_id
}

resource "digitalocean_firewall" "inbound_droplets_fw" {
  name        = "${var.name}-only-vpc-traffic"
  droplet_ids = var.inbound_droplet_ids

  inbound_rule {
    protocol         = "tcp"
    port_range       = "1-65535"
    source_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "1-65535"
    source_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }
}

resource "digitalocean_firewall" "wordpress_droplet_fw" {
  name        = "${var.name}-wordpress-traffic"
  droplet_ids = var.wordpress_droplet_id

  inbound_rule {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
  }
  
  inbound_rule {
      protocol         = "tcp"
      port_range       = "53"
      source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
      protocol         = "tcp"
      port_range       = "1-65535"
      source_addresses = [data.digitalocean_vpc.web.ip_range]
  }
  
  inbound_rule {
      protocol         = "udp"
      port_range       = "1-65535"
      source_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  inbound_rule {
      protocol         = "icmp"
      source_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
      protocol              = "tcp"
      port_range            = "80"
      destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
      protocol              = "tcp"
      port_range            = "443"
      destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
      protocol              = "icmp"
      destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
      protocol         = "tcp"
      port_range       = "53"
      destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

resource "digitalocean_firewall" "grafana_droplet_fw" {
  name        = "${var.name}-grafana-traffic"
  droplet_ids = var.grafana_droplet_id

  inbound_rule {
      protocol         = "tcp"
      port_range       = "3000"
      source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
      protocol         = "tcp"
      port_range       = "1-65535"
      source_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  inbound_rule {
      protocol         = "udp"
      port_range       = "1-65535"
      source_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  inbound_rule {
      protocol         = "icmp"
      source_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
      protocol              = "tcp"
      port_range            = "3000"
      destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }

  outbound_rule {
      protocol              = "icmp"
      destination_addresses = [data.digitalocean_vpc.web.ip_range]
  }
}