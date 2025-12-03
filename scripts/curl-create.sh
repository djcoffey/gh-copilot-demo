#!/usr/bin/env bash
set -euo pipefail
API_HOST=${API_HOST:-http://localhost:3000}
PAYLOAD=${1:-'{"id":0,"title":"New","artist":"You","price":9.99,"image_url":"https://example.com/1.png"}'}
curl -sS -X POST "$API_HOST/albums" -H "Content-Type: application/json" -d "$PAYLOAD" | jq '.' || curl -sS -X POST "$API_HOST/albums" -H "Content-Type: application/json" -d "$PAYLOAD"
