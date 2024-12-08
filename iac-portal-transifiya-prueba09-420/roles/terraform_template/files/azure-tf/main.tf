resource "azurerm_resource_group" "rg_main" {
  provider = azurerm.resources
  name     = substr("RSGRMAIN-${var.name}", 0, 90)
  location = var.location
  tags     = var.tags
  
  lifecycle {
    ignore_changes = [name]
  }
  
}

