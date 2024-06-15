### コンピュートインスタンス
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

### 予約済みパブリックIP
resource "oci_core_public_ip" "this" {
  compartment_id = var.compartment_id
  lifetime       = "RESERVED"
  display_name   = "lb-${var.name}"
}

### ロードバランサ
resource "oci_load_balancer_load_balancer" "this" {
  compartment_id = var.compartment_id
  display_name   = "lb-${var.name}"
  shape          = "flexible"
  subnet_ids = [
    var.subnet_id
  ]

  network_security_group_ids = [
    var.security_group
  ]
  shape_details {
    maximum_bandwidth_in_mbps = 10
    minimum_bandwidth_in_mbps = 10
  }
  reserved_ips {
    id = oci_core_public_ip.this.id
  }
}

# ロードバランサ バックエンドセット
resource "oci_load_balancer_backend_set" "this" {
  health_checker {
    protocol = "HTTP"
    url_path = "/"
  }
  load_balancer_id = oci_load_balancer_load_balancer.this.id
  name             = "lb-bs"
  policy           = "ROUND_ROBIN"
}

# ロードバランサ バックエンド
resource "oci_load_balancer_backend" "this" {
  backendset_name  = oci_load_balancer_backend_set.this.name
  ip_address       = oci_core_instance.this.private_ip
  load_balancer_id = oci_load_balancer_load_balancer.this.id
  port             = 80
}

# ロードバランサ リスナー
resource "oci_load_balancer_listener" "this" {
  default_backend_set_name = oci_load_balancer_backend_set.this.name
  load_balancer_id         = oci_load_balancer_load_balancer.this.id
  name                     = "lb-listener"
  port                     = 80
  protocol                 = "HTTP" # <- Not "HTTPS"
  # ssl_configuration {
  #   certificate_ids         = [var.cert_id]
  #   cipher_suite_name       = "oci-modern-ssl-cipher-suite-v1"
  #   verify_peer_certificate = "false"
  # }
}
