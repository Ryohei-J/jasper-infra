# provider "oci" {
#   region = "ap-tokyo-1"
# }

provider "oci" {
  tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaacuvi5e7zllyjkimtzzkil3cggwfcee37xwkmsodjhwdpdae3xjoq"
  user_ocid        = "ocid1.user.oc1..aaaaaaaan4la2zmt2qnfrqiicdnhq6xkplcmhtdet62v66eycdkdasejqguq"
  private_key_path = "/home/opc/.ssh/ssh-key-oci.key"
  fingerprint      = "7a:12:9d:cf:76:85:c2:3e:da:0b:c5:3f:7a:6e:b8:07"
  tenancy          = "ocid1.tenancy.oc1..aaaaaaaacuvi5e7zllyjkimtzzkil3cggwfcee37xwkmsodjhwdpdae3xjoq"
  region           = "ap-tokyo-1"
}
