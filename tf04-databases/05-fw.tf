data "http" "ip_address" {
    url = "https://api.ipify.org"
    request_headers = {
        Accept = "text/plan"
    }
}
# Regras SQL SERVER
resource "azurerm_sql_firewall_rule" "sqlfirewall_myip" {
    name = "personal-ip"
    resource_group_name = azurerm_resource_group.rg.name
    server_name = azurerm_sql_server.sqlserver.name
    start_ip_address = data.http.ip_address.body
    end_ip_address = data.http.ip_address.body
}

resource "azurerm_sql_firewall_rule" "sqlfirewall_azureservices" {
    name = "allow-azure-services-pulse"
    resource_group_name = azurerm_resource_group.rg.name
    server_name = azurerm_sql_server.sqlserver.name
    start_ip_address = "0.0.0.0"
    end_ip_address = "0.0.0.0"
}

#Regras POSTGRESQL
resource "azurerm_postgresql_firewall_rule" "pgsqlfirewall_myip" {
    name = "personal-ip"
    resource_group_name = azurerm_resource_group.rg.name
    server_name = azurerm_postgresql_server.pgsql.name
    start_ip_address = data.http.ip_address.body
    end_ip_address = data.http.ip_address.body
}

resource "azurerm_postgresql_firewall_rule" "pgsqlfirewall_azureservices" {
    name = "allow-azure-services-pulse"
    resource_group_name = azurerm_resource_group.rg.name
    server_name = azurerm_postgresql_server.pgsql.name
    start_ip_address = "0.0.0.0"
    end_ip_address = "0.0.0.0"
}

output "ip_address" { 
    value = [
        data.http.ip_address.body
    ]
}