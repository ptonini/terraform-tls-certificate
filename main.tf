resource "tls_private_key" "this" {
  algorithm = var.private_key_algorithm
  rsa_bits  = var.private_key_rsa_bits
}

resource "tls_self_signed_cert" "this" {
  count           = var.signer == null ? 1 : 0
  private_key_pem = tls_private_key.this.private_key_pem
  subject {
    common_name = var.common_name
  }
  ip_addresses          = var.ip_addresses
  dns_names             = var.dns_names
  uris                  = var.uris
  validity_period_hours = var.validity_period_hours
  is_ca_certificate     = var.is_ca_certificate
  allowed_uses          = var.allowed_uses
}

resource "tls_cert_request" "this" {
  count           = var.signer == null ? 0 : 1
  private_key_pem = tls_private_key.this.private_key_pem
  subject {
    common_name = var.common_name
  }
  ip_addresses = var.ip_addresses
  dns_names    = var.dns_names
  uris         = var.uris
}

resource "tls_locally_signed_cert" "this" {
  count                 = var.signer == null ? 0 : 1
  ca_cert_pem           = var.signer.cert_pem
  ca_private_key_pem    = var.signer.private_key_pem
  cert_request_pem      = tls_cert_request.this[0].cert_request_pem
  validity_period_hours = var.validity_period_hours
  is_ca_certificate     = var.is_ca_certificate
  allowed_uses          = var.allowed_uses
}

