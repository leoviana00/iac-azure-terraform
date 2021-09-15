resource "azurerm_resource_group" "rgstorage" {
    name = "blobstorage-state-terraform"
    location = var.location

    tags = {
    environment = var.environment
    responsavel = var.responsavel
  }
}

resource "random_string" "random" {
    length = 3
    special = false
    upper = false
    number = true
}

resource "azurerm_storage_account" "storagetf" {
    name = "blobstoragestate${random_string.random.result}"
    resource_group_name = azurerm_resource_group.rgstorage.name
    location = var.location
    account_tier = "Standard"
    access_tier = "Hot"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
    name = "blobstoragestateterraform"
    storage_account_name = azurerm_storage_account.storagetf.name
    depends_on = [ azurerm_storage_account.storagetf ]
}
