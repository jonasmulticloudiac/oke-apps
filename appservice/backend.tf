terraform {
  backend "http" {
    update_method = "PUT"
    address       = "https://objectstorage.${var.tf_state}"
  }
}







