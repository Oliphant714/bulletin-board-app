# Bulletin Board App

A simple client-side bulletin board app (pin/delete notes, stored in browser `localStorage`).

## Structure

```
app/                     # Static site source
  index.html
iac/                     # Terraform IaC — provisions S3 static website hosting
  provider.tf
  variables.tf
  main.tf
  outputs.tf
.github/workflows/
  release.yml             # CI/CD pipeline: terraform init/plan/apply via workflow_dispatch
```

## Deploying manually (for testing before the pipeline)

```bash
cd iac
terraform init
terraform plan
terraform apply -auto-approve
```

## Deploying via GitHub Actions

1. Go to the **Actions** tab → **Release Pipeline** → **Run workflow**.
2. Paste in fresh AWS Learner Lab credentials (Access Key ID, Secret Access Key, Session Token).
3. Run the workflow. On success, the site is live at the S3 static website endpoint
   shown in the `website_url` Terraform output.

**Note:** `var.bucket_name` in `iac/variables.tf` must be changed to something
globally unique before your first `apply` — S3 bucket names are unique across
all of AWS, not just your account.
