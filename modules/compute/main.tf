### コンピュートインスタンス
resource "oci_core_instance" "this" {
  count               = var.env == "develop" ? 1 : 2
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id_sub
  display_name        = "${var.name}-${count.index}"
  shape               = var.shape

  shape_config {
    ocpus         = var.ocpu
    memory_in_gbs = var.memory
  }
  source_details {
    source_id   = var.source_id
    source_type = var.source_type
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
  compartment_id = var.compartment_id_sub
  lifetime       = "RESERVED"
  display_name   = "lb-${var.name}"
}

### ロードバランサ
resource "oci_load_balancer_load_balancer" "this" {
  compartment_id = var.compartment_id_sub
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
  load_balancer_id = oci_load_balancer_load_balancer.this.id
  name             = "lb-bs"
  policy           = "ROUND_ROBIN"

  health_checker {
    protocol = "HTTP"
    url_path = "/"
  }

}

# ロードバランサ バックエンド
resource "oci_load_balancer_backend" "this" {
  for_each         = { for idx, instance in oci_core_instance.this : idx => instance }
  backendset_name  = oci_load_balancer_backend_set.this.name
  ip_address       = each.value.private_ip
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
