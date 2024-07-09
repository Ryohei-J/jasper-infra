resource "oci_mysql_mysql_db_system" "test_mysql_db_system" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id_sub
  shape_name          = "MySQL.HeatWave.VM.Standard"
  subnet_id           = var.subnet_id

  admin_password = var.db_password
  admin_username = var.db_username

  deletion_policy {
    is_delete_protected = false
  }
  display_name        = "db-${var.env}"
  is_highly_available = false
}
