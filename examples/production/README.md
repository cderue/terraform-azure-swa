# Production example

This example shows a production-oriented module call with explicit variables, an explicit resource group name, and operational tags.

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
```

Update `terraform.tfvars` before planning or applying so the repository token and naming match your environment.