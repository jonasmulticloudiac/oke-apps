variable "tenancy_ocid" {} 
variable "user_ocid" {}
variable "fingerprint" { }
variable "compartment_ocid" {}
variable "region" {}
variable "private_key" {}
variable "public_key_path" {}
variable "tf_state" {}


variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "cluster_options_kubernetes_network_config_pods_cidr" {
  default = "10.1.0.0/16"
}

variable "cluster_options_kubernetes_network_config_services_cidr" {
  default = "10.2.0.0/16"
}

variable "okeAppsClusterSubnet-CIDR" {
  default = "10.0.1.0/24"
}

variable "okeAppsNodePoolSubnet-CIDR" {
  default = "10.0.3.0/24"
}

variable "node_pool_quantity_per_subnet" {
  default = 2
}

variable "kubernetes_version" {
#  default = "v1.14.8"
   default = "v1.19.7"
}

variable "node_pool_size" {
  default = 3
}

variable "Shape" {
 default = "VM.Standard.E2.1"
}

variable "ClusterName" {
  default = "okeAppsOKECluster"
}


