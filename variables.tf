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
  default = "ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaabh6gcvyuwzvqegjcwrgrznqckmlumwca42iirdd3ztnq4xq5xwba" # subnet-public
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
variable "ssh_keys" {
  type      = string
  sensitive = true
}
