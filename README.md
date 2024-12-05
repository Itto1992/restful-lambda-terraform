# RESTful Lambda API implementation using terraform

1. Create a S3 bucket to store the terraform state.
2. Fill in the `envs/dev/backend.conf` with the S3 bucket name.
3. Run the following commands to deploy the infrastructure.

```bash
cd tf
terraform init -backend-config envs/dev/backend.conf
terraform apply -auto-approve
```

# NOTE
- The endpoint is open to the public. If you want to restrict access, please modify the `aws_iam_policy_document` in `tf/modules/api_gateway.tf` to include the necessary conditions.
- You can change the stage name by modifying `tf/variables.tf`.
