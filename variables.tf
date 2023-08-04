variable "common_name" {}

variable "signer" {
  default = null
  type = object({
    cert_pem        = string
    private_key_pem = string
  })
}

variable "validity_period_hours" {
  default = 87600
}

variable "is_ca_certificate" {
  default = false
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
}

variable "private_key_algorithm" {
  default = "RSA"
}

variable "private_key_rsa_bits" {
  default = 2048
}

