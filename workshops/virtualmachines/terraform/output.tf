output "ip" {
  value = digitalocean_droplet.vm.ipv4_address
}

output "price" {
  value = digitalocean_droplet.vm.price_hourly
}
