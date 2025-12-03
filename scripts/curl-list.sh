#!/usr/bin/env bash
set -euo pipefail
API_HOST=${API_HOST:-http://localhost:3000}
curl -sS "$API_HOST/albums" | jq '.' || curl -sS "$API_HOST/albums"
