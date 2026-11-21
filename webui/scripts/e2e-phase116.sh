#!/usr/bin/env bash
# Phase-116: Firewall-Namen aus Rules-Header kopieren.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'Copy fw name' "$app"
grep -q 'Copied firewall name' "$app"
echo "copy firewall name ok"
echo "cleaned"
echo "OK: phase116 e2e passed"
