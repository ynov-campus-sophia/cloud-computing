output "vpc_id" {
  value = digitalocean_vpc.network_vpc.id
}

data "digitalocean_region" "sfo2" {
  slug = "sfo2"
}

output "regions" {
  value = data.digitalocean_region.sfo2
}