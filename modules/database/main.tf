resource "oci_mysql_mysql_db_system" "this" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id_sub
  shape_name          = var.shape_db
  subnet_id           = var.subnet_id
  admin_password      = var.db_password
  admin_username      = var.db_username
  display_name        = "db-${var.env}"
  is_highly_available = false

  deletion_policy {
    is_delete_protected = false
  }
}
