variable "image" {
  type = string
  default = "ubuntu-24-04-x64"
}
variable "size" {
  type = string
  default = "s-2vcpu-4gb"
}
variable "pubkey" {
  type = string
}

variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "tpl" {
  type = string
  default = "docker.yaml"
}