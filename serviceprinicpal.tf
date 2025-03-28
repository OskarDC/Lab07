resource "azuread_application" "declerck-app" {
  display_name = "Lab07-app"
  owners = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "declerck-app-sp" {
  client_id = azuread_application.declerck-app.client_id
  app_role_assignment_required = false
  owners = [data.azuread_client_config.current.object_id]
}

resource "azurerm_role_assignment" "declerck-app-sp-role" {
  scope                = azurerm_resource_group.declerck-rg.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.declerck-app-sp.object_id
}

resource "azuread_application_federated_identity_credential" "github-actions" {
  application_id = azuread_application.declerck-app.id
  display_name          = "GitHubActionsFederation-${var.github_branch}"
  description           = "Federated credential for GitHub Actions in ${var.github_branch} environment"
  audiences            = ["api://AzureADTokenExchange"]
  issuer               = "https://token.actions.githubusercontent.com"
  subject              = "repo:${var.github_repo}:ref:refs/heads/${var.github_branch}"
}