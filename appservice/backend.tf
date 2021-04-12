terraform {
  backend "http" {
    update_method = "PUT"
    address       = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/p/5Rlj6x80V7aJML__7aypnwhjdaIEU9VmcYMj_96WZjw_F1xxZPSIZGN-srdV8Zq3/n/gr6yn2oixrh2/b/terraform-okeapps/o/terraform.tfstate"
  }
}







