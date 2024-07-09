variable "compartment_id_root" {
  type      = string
  sensitive = true
}
variable "compartment_id_sub" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaan35zm26h3a3rjmawaahczuhmbzx64un6jj5zv6okjm3yx4f2renq" # production
}
variable "subnet_id" {
  type    = string
  default = "ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaarqygvtys4t42dc6qd6evmgaf7ilk6ck5udfna5235gvfkre7xzwq" # production-public
}
variable "security_group" {
  type    = string
  default = "ocid1.networksecuritygroup.oc1.ap-tokyo-1.aaaaaaaazvovsr73r5yrsqzbcqxjaij3zh7ijfs7je5vgxb7g2iwmvqwicba" # nsg-default
}
variable "env" {
  type    = string
  default = "production"
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
variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_username" {
  type      = string
  sensitive = true
}
