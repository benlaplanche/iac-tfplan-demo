#!/bin/bash
TERRAFORM_API_HOST=https://app.terraform.io

plan=$tf_plan_input
echo $plan
echo "----"

plan_path=$(echo $plan | grep -Eo 'runs/run-[A-Za-z0-9]+')
echo $plan_path
echo "----"

plan_json_path=$(curl -H "Authorization: Bearer $TERRAFORM_API_TOKEN" $TERRAFORM_API_HOST/api/v2/${plan_path}/plan | jq -r '.data.links["json-output"]')
echo $plan_json_path
echo "---"

curl -H "Authorization: Bearer $TERRAFORM_API_TOKEN" -H "Content-Type: application/vnd.api+json" -L $TERRAFORM_API_HOST$plan_json_path > tf-plan.json