#Grupo de recursos de banco de dados
resource "azurerm_resource_group" "rg" {
  name     = "rg-database"
  location = "brazilsouth"
}

#Grupo de recursos de mensageria
resource "azurerm_resource_group" "msg" {
  name     = "rg-msg"
  location = var.location
}