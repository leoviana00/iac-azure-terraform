provider "azurerm" {
    features {

    }
}

resource "azurerm_resource_group" "rg" {
    name = "rg-aks-${terraform.workspace}"
    location = var.location

    tags = {
    ambiente = "${terraform.workspace}"
    responsavel = var.responsavel
  }
}