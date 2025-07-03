variable "do_token" {
  description = "DigitalOcean API token"
}

variable "name" {
  type        = string
  description = "Infrastructure project name"
  default     = "projet-cloud-computing"
}

variable "region" {
  type    = string
  default = "fra1"
}

variable "image" {
  type        = string
  description = "OS to install on the servers"
  default     = "ubuntu-20-04-x64"
}

variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "ssh_keys_ids" {
  type = list(string)
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to use for the droplets"
}

variable "inbound_droplet_ids" {
  type        = list(string)
  description = "List of droplet IDs to apply the inbound firewall rules"
  default     = []
}

variable "wordpress_droplet_id" {
  type        = list(string)
  description = "Droplet ID for the WordPress instance"
}

variable "grafana_droplet_id" {
  type        = list(string)
  description = "Droplet ID for the Grafana instance"
  default     = []
}