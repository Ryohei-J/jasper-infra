module "compute" {
  source = "../../modules/compute"

  compartment_id_sub = var.compartment_id_sub
  security_group     = var.security_group
  subnet_id          = var.subnet_id
  env                = var.env
  name               = var.name
  shape              = var.shape
  ocpu               = var.ocpu
  memory             = var.memory
  source_id          = var.source_id
  source_type        = var.source_type
  ssh_keys           = var.ssh_keys
}

module "database" {
  source = "../../modules/database"

  compartment_id_sub = var.compartment_id_sub
  subnet_id          = var.subnet_id
  env                = var.env
  shape_db           = var.shape_db
  db_password        = var.db_password
  db_username        = var.db_username
}
