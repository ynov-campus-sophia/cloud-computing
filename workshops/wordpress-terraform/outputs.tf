output "wordpress_app_ip" {
  value = digitalocean_droplet.wordpress-app.ipv4_address
}

output "wordpress_bdd_host" {
  value = digitalocean_database_cluster.wordpress-bdd.private_host
}
