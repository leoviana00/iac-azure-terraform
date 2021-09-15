provider "azurerm" {
  features {

  }
}

data "azurerm_key_vault" "getkeyvault" {
  name                = "keyvault-pulse-dev"
  resource_group_name = "rg-keyvault-dev"
}

data "azurerm_key_vault_secret" "secretget" {
  name         = "secret-terraform"
  key_vault_id = data.azurerm_key_vault.getkeyvault.id
}

output "secret" {
  value = data.azurerm_key_vault_secret.secretget.value
}