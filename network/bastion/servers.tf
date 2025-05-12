resource "digitalocean_droplet" "web" {
  count     = var.droplet_count
  image     = var.image
  name      = "server-${var.name}-${var.region}-${count.index + 1}"
  region    = var.region
  size      = var.droplet_size
  ssh_keys  = [data.digitalocean_ssh_key.main.id]
  vpc_uuid  = digitalocean_vpc.web.id
  tags      = ["${var.name}-server"]
}