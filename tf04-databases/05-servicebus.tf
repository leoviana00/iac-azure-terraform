resource "azurerm_servicebus_namespace" "namespace" {
  name                = "pulse-servicebus-namespace"
  location            = azurerm_resource_group.msg.location
  resource_group_name = azurerm_resource_group.msg.name
  sku                 = "Standard"

  tags = {
    responsavel = var.responsavel
    ambiente    = var.ambiente
  }
}

resource "azurerm_servicebus_queue" "queue" {
  name                = "pulse_servicebus_queue"
  resource_group_name = azurerm_resource_group.msg.name
  namespace_name      = azurerm_servicebus_namespace.namespace.name

  enable_partitioning = true
}

resource "azurerm_servicebus_topic" "topic" {
  name                = "pulse_servicebus_topic"
  resource_group_name = azurerm_resource_group.msg.name
  namespace_name      = azurerm_servicebus_namespace.namespace.name

  enable_partitioning = true
}