# resource "github_actions_secret" "declerck-as-client-id" {
#     repository = "Lab07-minimal-api-deployment"
#     secret_name = "AZURE_CLIENT_ID"
#     plaintext_value = azuread_application.declerck-app.client_id
# }

resource "github_actions_secret" "declerck-as-subscription-id" {
    repository = "Lab07-minimal-api-deployment"
    secret_name = "AZURE_SUBSCRIPTION_ID"
    plaintext_value = data.azurerm_client_config.current.subscription_id
}

resource "github_actions_secret" "declerck-as-tenant-id" {
    repository = "Lab07-minimal-api-deployment"
    secret_name = "AZURE_TENANT_ID"
    plaintext_value = data.azurerm_client_config.current.tenant_id
}