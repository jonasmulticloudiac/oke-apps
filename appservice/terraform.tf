terraform {
  backend "http" {
    update_method = "PUT"
    address       = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/p/XjYWDhjtZtHjGevJNQpvbj_4J7ky6Uytbx-WQN9CZLJZvmBU0FSHAbC3jazx9FPj/n/gr6yn2oixrh2/b/terraform-okeapps/o/terraform.tfstate"
  }
}
