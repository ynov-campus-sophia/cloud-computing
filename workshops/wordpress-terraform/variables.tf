variable "do_token" {
  type        = string
  sensitive   = true
  description = "DigitalOcean API token"
}

variable "vpc_id" {
  type        = string
  description = "ID du VPC existant"
}
variable "pubkey" {
  type = string
}
variable "network_name" {
  type = string
}
variable "tpl" {
  type        = string
  description = "Template name to use for droplets"
  default     = "bdd.yaml"
}
variable "image" {
  description = "Image à utiliser pour la VM"
  type        = string
  default     = "ubuntu-24-04-x64"
}
variable "ssh_keys_ids" {
  type = list(string)
}
variable "size" {
  description = "Taille du Droplet"
  type        = string
  default     = "db-s-1vcpu-1gb"
}

variable "region" {
  description = "Région DigitalOcean (ex: ams3, fra1)"
  type        = string
  default     = "ams3"
}
variable "name" {
  description = "Nom du cluster PostgreSQL"
  type        = string
}
