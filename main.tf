module "compute" {
  source = "./modules/compute"

  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  security_group      = var.security_group
  subnet_id           = var.subnet_id
  name                = var.name
  ssh_keys            = var.ssh_keys
}