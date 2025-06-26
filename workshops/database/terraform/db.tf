resource "digitalocean_database_cluster" "postgres-example" {
  name       = var.name
  engine     = "pg"
  version    = "15"
  size       = var.size
  region     = "ams"
  node_count = 1
}