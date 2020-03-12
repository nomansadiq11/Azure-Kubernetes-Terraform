

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "akscluster"
  resource_group_name = "${azurerm_resource_group.akscluster.name}"
  location            = "${var.location}"
  dns_prefix          = "akscluster"

  default_node_pool {
    name            = "default"
    node_count      = 3
    vm_size         = "Standard_D2s_v3"
    
  }

  service_principal {
    client_id     = "clientid"
    client_secret = "secretkey"
  }



  tags = {
    Environment = "${var.tag}"
  }
}
