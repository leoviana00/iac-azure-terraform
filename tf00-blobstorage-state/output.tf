output "blobstorage-name" {
    value = [
        azurerm_storage_account.storagetf.name
    ]
}

output "rg-name" {
    value = [
        azurerm_resource_group.rgstorage.name
    ]
}

output "container-name" {
    value = [
        azurerm_storage_container.container.name
    ]
}

output "blobstorage-chave-primaria" {
    value = [
        azurerm_storage_account.storagetf.primary_access_key
    ]
}

resource "local_file" "storage-terraform" {
   sensitive_content = templatefile("${path.module}/backend.tmpl", {
    rg_name                     = azurerm_resource_group.rgstorage.name
    blobstorage_chave_primaria  = azurerm_storage_account.storagetf.primary_access_key
    blobstorage_name            = azurerm_storage_account.storagetf.name
    conatiner_name              = azurerm_storage_container.container.name
  })
  filename = "../tf01-akscluster/backend.tf"
}

