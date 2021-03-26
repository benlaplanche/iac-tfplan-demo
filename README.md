# Snyk Infrastructure as Code - Terraform Cloud Demo

This demo app shows Snyk Infrastructure as Code integrated with Terraform Cloud.

When you create a `pull_request` the terraform plan workflow will kick off, as part of this check the plan output is scanned through the Snyk IaC CLI.
You can see the output of this in your GitHub Actions build run.

## Setup

Setup a GitHub secret called `SNYK_TOKEN` which is your API token for Snyk
Setup a GitHub secret called `TF_API_TOKEN` which is your Terraform Cloud API Token.
Change the `organization` and `workspaces` in the `s3.tf` file to match your setup. These are your Terraform Cloud settings.
