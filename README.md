# Terraform No-Code Infrastructure Module for Azure Static Web Apps

The Terraform No-Code Infrastructure Module for Azure Static Web Apps simplifies the deployment and management of Azure Static Web Apps without requiring deep Terraform expertise. This module provides a declarative, configuration-driven approach to provisioning web applications with built-in support for CI/CD, authentication, and global content delivery.

## Requirements

- Terraform: `>= 1.0` declared by the module, `1.8.5+` recommended to match the CI baseline.
- AzureRM provider: `hashicorp/azurerm ~> 4.22.0`.

## Usage

```hcl
module "static_web_app" {
	source = "github.com/cderue/terraform-azure-swa"

	location            = "westeurope"
	env                 = "dev"
	app                 = "my-static-web-app"
	resource_group_name = "rg-static-web-app-dev"
	repository_url      = "https://github.com/example/frontend-app"
	repository_branch   = "main"
	repository_token    = var.repository_token
	tags = {
		owner = "platform-team"
	}
}

variable "repository_token" {
	description = "GitHub token used by Azure Static Web Apps to access the repository."
	type        = string
	sensitive   = true
}
```

## Examples

- [examples/basic](examples/basic) provisions a single Static Web App connected to a production branch.
- [examples/preview](examples/preview) shows the same module wired to a preview branch for non-production environments.
- [examples/production](examples/production) demonstrates a production-oriented setup with explicit variables, tags, and a fixed resource group name.

## Inputs

- `resource_group_name`: optional override for the Azure resource group name.
- `tags`: additional tags merged with the default `app` and `environment` tags.
- `repository_token`: sensitive token used by Azure to connect to the source repository.
- `location`, `env`, `app`, `repository_url`, `repository_branch`: validated to reject empty or malformed values before apply.

## Outputs

- `azurerm_static_site_url`: default hostname assigned by Azure Static Web Apps.
- `static_web_app_id`: resource ID of the Static Web App.
- `static_web_app_name`: resource name of the Static Web App.
- `resource_group_name`: provisioned Azure resource group name.
- `resource_group_id`: resource ID of the provisioned Azure resource group.

## Continuous integration

The GitHub Actions workflow in [.github/workflows/terraform-ci.yml](.github/workflows/terraform-ci.yml) runs:

- `terraform fmt -check -recursive`
- `terraform init -backend=false`
- `terraform validate`

The workflow validates both the root module and the Terraform examples.

## Key features:
- No-code approach – Deploy infrastructure using simple configuration files, eliminating the need for custom Terraform scripts.
- Automated deployment – Seamless integration with GitHub Actions and Azure DevOps for continuous deployment.
- Flexible configuration – Supports various hosting options, including custom domains, staging environments, and backend API integrations.
- Security & compliance – Enables role-based access control (RBAC), authentication providers (GitHub, Azure AD, etc.), and networking configurations.
- Scalability & performance – Leverages Azure's global CDN and edge locations for faster content delivery.

## Use cases:
- Deploying front-end applications (React, Angular, Vue, etc.) without managing infrastructure.
- Hosting JAMstack applications with serverless APIs.
- Automating web app deployment via GitHub repositories.

## Production example workflow

The production example keeps variables separate from the module call:

1. Copy [examples/production/terraform.tfvars.example](examples/production/terraform.tfvars.example) to a local tfvars file.
2. Replace the placeholder values, especially the repository token.
3. Run `terraform init` and `terraform plan` from [examples/production](examples/production).
