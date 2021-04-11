resource "oci_core_vcn" "okeAppsVCN" {
  cidr_block     = var.VCN-CIDR
  compartment_id = oci_identity_compartment.okeAppsCompartment.id
  display_name   = "okeAppsVCN"
}

resource "oci_core_internet_gateway" "okeAppsInternetGateway" {
  compartment_id = oci_identity_compartment.okeAppsCompartment.id
  display_name   = "okeAppsInternetGateway"
  vcn_id         = oci_core_vcn.okeAppsVCN.id
}

resource "oci_core_route_table" "okeAppsRouteTableViaIGW" {
  compartment_id = oci_identity_compartment.okeAppsCompartment.id
  vcn_id         = oci_core_vcn.okeAppsVCN.id
  display_name   = "okeAppsRouteTableViaIGW"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id =  oci_core_internet_gateway.okeAppsInternetGateway.id
  }
}

resource "oci_core_security_list" "okeAppsOKESecurityList" {
    compartment_id = oci_identity_compartment.okeAppsCompartment.id
    display_name = "okeAppsOKESecurityList"
    vcn_id = oci_core_vcn.okeAppsVCN.id
    
    egress_security_rules {
        protocol = "All"
        destination = "0.0.0.0/0"
    }

    /* This entry is necesary for DNS resolving (open UDP traffic). */
    ingress_security_rules {
        protocol = "17"
        source = var.VCN-CIDR
    }
}

resource "oci_core_subnet" "okeAppsClusterSubnet" {
  cidr_block          = var.okeAppsClusterSubnet-CIDR
  compartment_id      = oci_identity_compartment.okeAppsCompartment.id
  vcn_id              = oci_core_vcn.okeAppsVCN.id
  display_name        = "okeAppsClusterSubnet"

  security_list_ids = [oci_core_vcn.okeAppsVCN.default_security_list_id, oci_core_security_list.okeAppsOKESecurityList.id]
  route_table_id    = oci_core_route_table.okeAppsRouteTableViaIGW.id
}

resource "oci_core_subnet" "okeAppsNodePoolSubnet" {
  cidr_block          = var.okeAppsNodePoolSubnet-CIDR
  compartment_id      = oci_identity_compartment.okeAppsCompartment.id
  vcn_id              = oci_core_vcn.okeAppsVCN.id
  display_name        = "okeAppsNodePoolSubnet"

  security_list_ids = [oci_core_vcn.okeAppsVCN.default_security_list_id, oci_core_security_list.okeAppsOKESecurityList.id]
  route_table_id    = oci_core_route_table.okeAppsRouteTableViaIGW.id
}

