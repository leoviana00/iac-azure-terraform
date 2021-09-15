resource "azurerm_sql_server" "sqlserverelastic" {
  name                = "mssqlserverwlasticpool"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  version                      = "12.0"
  administrator_login          = "administratorsqlserver"
  administrator_login_password = "thisIsNotMyP@$$word"
}

resource "azurerm_sql_elasticpool" "sqlelasticpool" {
    name = "azsqlelasticpooltf"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    server_name = azurerm_sql_server.sqlserverelastic.name
    edition = "Basic"
    db_dtu_min = 0
    db_dtu_max = 5
    pool_size = 5000
}