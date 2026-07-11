#!/usr/bin/env bash
set -euo pipefail

URL="${APP_URL:-https://app.example.com}"

echo "SQL injection test:"
curl -k -s -o /dev/null -w "%{http_code}\n" "$URL/?id=1%27%20OR%20%271%27=%271"

echo "XSS test:"
curl -k -s -o /dev/null -w "%{http_code}\n" "$URL/?q=%3Cscript%3Ealert(1)%3C/script%3E"
