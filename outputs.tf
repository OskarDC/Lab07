output "app_service_url" {
  value = azurerm_app_service.declerck-as.default_site_hostname
}