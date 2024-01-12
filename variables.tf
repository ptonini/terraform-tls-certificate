variable "common_name" {}

variable "signer" {
  type = object({
    cert_pem        = string
    private_key_pem = string
  })
  default = null
}

variable "validity_period_hours" {
  default = 87600
  nullable = false
}

variable "is_ca_certificate" {
  default = false
  nullable = false
}

variable "ip_addresses" {
  default = null
}

variable "dns_names" {
  default = null
}

variable "uris" {
  default = null
}

variable "allowed_uses" {
  type    = list(string)
  default = []
  nullable = false
}

variable "private_key_algorithm" {
  default = "RSA"
  nullable = false
}

variable "private_key_rsa_bits" {
  default = 2048
  nullable = false
}

