module "compute" {
  source = "./modules/compute"

  compartment_id_sub = var.compartment_id_sub
  security_group     = var.security_group
  subnet_id          = var.subnet_id
  env                = var.env
  name               = var.name
  ssh_keys           = var.ssh_keys
}
