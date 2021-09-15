# ACR

output "acr_usuario" {
    value = azurerm_container_registry.acr.admin_username
}

output "acr_senha" {
    value = azurerm_container_registry.acr.admin_password
}

output "acr_url" {
    value = azurerm_container_registry.acr.login_server
}

# AKS

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "host" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.host
}

output "client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "cluster_username" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.username
}

output "cluster_password" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.password
}