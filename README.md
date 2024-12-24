# Terraform Cloud Setup

Set Environment Variables:

In your Terraform Cloud workspace, go to the "Variables" section.
Add the following environment variables with the appropriate values from your Azure service principal:

`TF_VAR_client_id
TF_VAR_client_secret
TF_VAR_subscription_id
TF_VAR_tenant_id`

After setting these environment variables, Terraform Cloud will use the service principal credentials to authenticate with Azure