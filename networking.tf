resource "azurerm_virtual_network" "declerck-vnet" {
  name                = "${var.lastname}-vnet-${terraform.workspace}-${lower(replace(var.location, " ", ""))}"
  location            = azurerm_resource_group.declerck-rg.location
  resource_group_name = azurerm_resource_group.declerck-rg.name
  address_space       = ["172.16.0.0/16"]
}

resource "azurerm_subnet" "declerck-snet" {
  name                 = "${var.lastname}-snet-${terraform.workspace}"
  resource_group_name  = azurerm_resource_group.declerck-rg.name
  virtual_network_name = azurerm_virtual_network.declerck-vnet.name
  address_prefixes     = var.address_prefixes
}