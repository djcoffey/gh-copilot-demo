#!/usr/bin/env bash
set -euo pipefail
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <id> <json-payload> [API_HOST]"
  exit 2
fi
ID=$1
PAYLOAD=$2
API_HOST=${3:-${API_HOST:-http://localhost:3000}}
curl -sS -X PUT "$API_HOST/albums/$ID" -H "Content-Type: application/json" -d "$PAYLOAD" -w "\nStatus: %{http_code}\n"
