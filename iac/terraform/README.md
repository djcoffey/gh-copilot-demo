Local Terraform helpers
=======================

This folder contains a minimal, local-focused Terraform config that calls repository scripts via `null_resource` + `local-exec`.

Files
- `local.tf` - defines null_resources:
  - `null_resource.start_api` — runs `./scripts/start-api.sh` to start the demo API in background.
  - `null_resource.stop_api` — runs `./scripts/stop-api.sh` to stop the demo API.
  - `null_resource.build_frontend` — runs `npm install` and `npm run build` in `album-viewer`.

Usage
1. Initialize Terraform in this directory:

```bash
cd iac/terraform
terraform init
```

2. Start the API (runs the repository start script):

```bash
terraform apply -target=null_resource.start_api
```

3. Stop the API:

```bash
terraform apply -target=null_resource.stop_api
```

4. Build the frontend:

```bash
terraform apply -target=null_resource.build_frontend
```

Caveats
- These Terraform resources invoke local scripts and are intended for developer convenience only. They do not provision cloud infrastructure.
- Avoid using Terraform provisioners for long-running processes in production. The `start-api` script uses `nohup` to keep the process running outside the Terraform lifecycle; use `stop-api` to terminate it.
- Running `terraform destroy` will not automatically stop the background processes created by `nohup`; use the `stop_api` target or `./scripts/stop-api.sh` instead.
