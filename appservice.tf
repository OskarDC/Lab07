resource "azurerm_app_service_plan" "declerck-asp" {
  name                = "${var.lastname}-asp-${terraform.workspace}-${lower(replace(var.location, " ", ""))}"
  location            = azurerm_resource_group.declerck-rg.location
  resource_group_name = azurerm_resource_group.declerck-rg.name
  kind                = "Linux"
  reserved = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "declerck-as" {
  name                = "${var.lastname}-as-${terraform.workspace}-${lower(replace(var.location, " ", ""))}"
  location            = azurerm_resource_group.declerck-rg.location
  resource_group_name = azurerm_resource_group.declerck-rg.name
  app_service_plan_id = azurerm_app_service_plan.declerck-asp.id

  site_config {
    linux_fx_version = "DOTNETCORE|8.0"
    min_tls_version  = "1.2"
  }

  https_only = true
}