provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-keyvault-${terraform.workspace}"
  location = var.location

  tags = {
    ambiente    = "${terraform.workspace}"
    responsavel = var.responsavel
  }
}

data "azurerm_client_config" "current" {

}

resource "azurerm_key_vault" "keyvault" {
  name                = "keyvault-pulse-${terraform.workspace}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    # application_id = "value"
    certificate_permissions = ["list"]
    key_permissions         = ["create", "get", "list"]
    object_id               = data.azurerm_client_config.current.object_id
    tenant_id               = data.azurerm_client_config.current.tenant_id
    secret_permissions = [
      "set",
      "get",
      "delete",
      "purge",
      "recover",
      "list"
    ]
  }
}

resource "azurerm_key_vault_secret" "secret" {
  name            = "secret-terraform"
  value           = "mysecret@1234"
  key_vault_id    = azurerm_key_vault.keyvault.id
  expiration_date = "2021-12-31T00:00:00Z"
}

data "azurerm_key_vault_secret" "getsecret" {
  name         = "secret-terraform"
  key_vault_id = azurerm_key_vault.keyvault.id
}

output "secret_value" {
  value = data.azurerm_key_vault_secret.getsecret.value
}

output "keyvault_url" {
  value = azurerm_key_vault.keyvault.vault_uri
}