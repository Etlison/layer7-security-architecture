#!/usr/bin/env bash
set -euo pipefail

URL="${APP_URL:-https://app.example.com}"

echo "Smoke testing $URL"
curl -k -I "$URL"
