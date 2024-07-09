module "compute" {
  source = "../../modules/compute"

  compartment_id_sub = var.compartment_id_sub
  security_group     = var.security_group
  subnet_id          = var.subnet_id
  env                = var.env
  name               = var.name
  shape              = var.shape
  ssh_keys           = var.ssh_keys
}

module "database" {
  source = "../../modules/database"

  compartment_id_sub = var.compartment_id_sub
  subnet_id          = var.subnet_id
  env                = var.env
  db_password        = var.db_password
  db_username        = var.db_username
}
