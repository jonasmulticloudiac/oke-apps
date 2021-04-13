data "terraform_remote_state" "proj" {
  backend = "http"
  config {
    address = "https://objectstorage.oraclecloud.com/p/5Rlj6x80V7aJML__7aypnwhjdaIEU9VmcYMj_96WZjw_F1xxZPSIZGN-srdV8Zq3/n/gr6yn2oixrh2/b/terraform-okeapps/o/terraform.tfstate"
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key      = var.private_key
  region           = var.region
}
