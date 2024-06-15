resource "oci_core_instance" "this" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = var.name
  shape               = "VM.Standard.E4.Flex"
  shape_config {
    ocpus         = 1
    memory_in_gbs = 8
  }
  source_details {
    source_id   = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaahhqgmyj2zb3bw6wnnvkvo7godb5vqpqqtuknosn5k5uvk5wphhwa"
    source_type = "image"
  }
  create_vnic_details {
    nsg_ids = [
      var.security_group
    ]
    subnet_id = var.subnet_id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_keys
    user_data           = base64encode(file("${path.module}/userdata/init.sh"))
  }
}
