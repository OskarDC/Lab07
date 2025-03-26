resource "azurerm_resource_group" "declerck-rg" {
  name = "${var.lastname}-rg-${terraform.workspace}-${lower(replace(var.location, " ", ""))}"
  location = var.location
}