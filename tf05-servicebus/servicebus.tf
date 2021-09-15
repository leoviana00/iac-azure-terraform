resource "azurerm_resource_group" "rg" {
  name     = "pulse-servicebus"
  location = var.location
}

resource "azurerm_servicebus_namespace" "namespace" {
  name                = "pulse-servicebus-namespace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

tags = {
    environment = var.environment
    responsavel = var.responsavel
    ambiente = "${terraform.workspace}"
  }
}

resource "azurerm_servicebus_queue" "queue" {
  name                = "pulse_servicebus_queue"
  resource_group_name = azurerm_resource_group.rg.name
  namespace_name      = azurerm_servicebus_namespace.namespace.name

  enable_partitioning = true
}

resource "azurerm_servicebus_topic" "topic" {
  name                = "pulse_servicebus_topic"
  resource_group_name = azurerm_resource_group.rg.name
  namespace_name      = azurerm_servicebus_namespace.namespace.name

  enable_partitioning = true
}