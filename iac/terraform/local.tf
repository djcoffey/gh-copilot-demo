terraform {
  required_version = ">= 1.0"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "null" {}

# Start the albums-api using the repo start script.
resource "null_resource" "start_api" {
  provisioner "local-exec" {
    command = "${path.module}/../../scripts/start-api.sh"
  }

  # Re-run when explicitly targeted or when files change under scripts
  triggers = {
    scripts_hash = filesha256("${path.module}/../../scripts/start-api.sh")
  }
}

# Stop the albums-api using the repo stop script.
resource "null_resource" "stop_api" {
  provisioner "local-exec" {
    command = "${path.module}/../../scripts/stop-api.sh"
  }
}

# Build the frontend (npm install + build). Use apply with -target=null_resource.build_frontend
resource "null_resource" "build_frontend" {
  provisioner "local-exec" {
    command = "bash -lc 'cd ${path.module}/../../album-viewer && npm install && npm run build'"
  }

  triggers = {
    package_json = filesha256("${path.module}/../../album-viewer/package.json")
  }
}

output "start_api_command" {
  value = "terraform apply -target=null_resource.start_api"
}

output "stop_api_command" {
  value = "terraform apply -target=null_resource.stop_api"
}

output "build_frontend_command" {
  value = "terraform apply -target=null_resource.build_frontend"
}
