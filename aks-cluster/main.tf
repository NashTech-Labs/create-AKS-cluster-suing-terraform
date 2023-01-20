 resource "azurerm_resource_group" "aks-rg" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = var.cluster_name
  kubernetes_version  = var.kubernetes_version  #check the k8s version is available or not.
                                                # az aks get-versions --location <location-name>
  location = var.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix = var.cluster_name

  default_node_pool {
    name = "vm"
    node_count = var.node_count # use node according to your need
    vm_size = "Standard_B2s" # use vm size according to your need.
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin = "kubenet" 
  }
}
