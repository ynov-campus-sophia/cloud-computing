variable "do_token" {}

variable "name" {
  type        = string
  description = "Infrastructure project name"
  default     = "ynov-prod"
}

variable "region" {
  type    = string
  default = "ams"
}

variable "ip_range" {
  type        = string
  description = "IP range for VPC"
  default     = "192.168.24.0/24"
}

variable "droplet_count" {
  type    = number
  default = 1
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

variable "ssh_key" {
  type = string
}

variable "db_count" {
  type    = number
  default = 1
}

variable "database_size" {
  type    = string
  default = "db-s-1vcpu-1gb"
}