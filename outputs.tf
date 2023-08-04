output "this" {
  value = {
    private_key_pem = tls_private_key.this.private_key_pem
    cert_pem        = var.signer == null ? tls_self_signed_cert.this[0].cert_pem : tls_locally_signed_cert.this[0].cert_pem
  }
}