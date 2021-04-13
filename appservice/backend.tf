terraform {
  backend "http" {
    update_method = "PUT"
    address       = terraform_remote_state.proj
  }
}







