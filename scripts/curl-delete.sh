#!/usr/bin/env bash
set -euo pipefail
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <id> [API_HOST]"
  exit 2
fi
ID=$1
API_HOST=${2:-${API_HOST:-http://localhost:3000}}
curl -sS -X DELETE "$API_HOST/albums/$ID" -w "\nStatus: %{http_code}\n"
