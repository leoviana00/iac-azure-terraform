resource "azurerm_sql_server" "sqlserver" {
  name                = "mssqlserverpulse"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  version                      = "12.0"
  administrator_login          = "administratorsqlserver"
  administrator_login_password = "thisIsNotMyP@$$word"
}

resource "azurerm_mssql_database" "mssqldatabase" {
  name         = "db_pulse"
  server_id    = azurerm_sql_server.sqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "Basic"
}

resource "azurerm_sql_database" "azsqldatabase" {
  name                = "pulse-azsqldatabase"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
}