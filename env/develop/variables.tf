variable "compartment_id_root" {
  type      = string
  sensitive = true
}
variable "compartment_id_sub" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaaqid54egyjlx6ujxbdqfkunyrc5uv5u5cc5waz3enrmfsoa2d3rdq" # develop
}
variable "subnet_id" {
  type    = string
  default = "ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaatctfjbcpkklqplkgkw32veoyperdb2labcif3e7bir3ke4i5ataa" # develop-public
}
variable "security_group" {
  type    = string
  default = "ocid1.networksecuritygroup.oc1.ap-tokyo-1.aaaaaaaazvovsr73r5yrsqzbcqxjaij3zh7ijfs7je5vgxb7g2iwmvqwicba" # nsg-default
}
variable "env" {
  type    = string
  default = "develop"
}
variable "name" {
  type    = string
  default = "web"
}
variable "shape" {
  type    = string
  default = "VM.Standard.E4.Flex"
}
variable "ocpu" {
  type    = number
  default = 1
}
variable "memory" {
  type    = number
  default = 16
}
variable "source_id" {
  type    = string
  default = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaahhqgmyj2zb3bw6wnnvkvo7godb5vqpqqtuknosn5k5uvk5wphhwa"
}
variable "source_type" {
  type    = string
  default = "image"
}
variable "ssh_keys" {
  type      = string
  sensitive = true
}
variable "shape_db" {
  type    = string
  default = "MySQL.HeatWave.VM.Standard"
}

variable "db_password" {
  type      = string
  sensitive = true
}
variable "db_username" {
  type      = string
  sensitive = true
}
