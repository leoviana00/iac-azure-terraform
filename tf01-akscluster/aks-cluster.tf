resource "azurerm_kubernetes_cluster" "aks" {
    name = "aks-pulse-${terraform.workspace}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name 

    dns_prefix = "pulse-k8s"


    default_node_pool {
        name = "agentpool"
        node_count = 2
        vm_size = "Standard_B2s"
        # os_disk_size_gb = 30
    }

    identity {
        type = "SystemAssigned"
    }

    role_based_access_control {
      enabled = true
    }   

    tags = {
      ambiente = "${terraform.workspace}"
      responsavel = var.responsavel
    }
  
}

resource "azurerm_role_assignment" "aks_acr" {
    scope = azurerm_container_registry.acr.id
    role_definition_name = "AcrPull"
    principal_id = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}