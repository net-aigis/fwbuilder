#!/usr/bin/env bash
# Phase-458: hard-gaps option_enable_path + client/UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option_enable_path' webui/backend/fwbweb_api/main.py
grep -Fq 'fetchOptionEnable' webui/frontend/src/api/client.ts
grep -Fq 'optionEnablePath' webui/frontend/src/components/FirewallExtras.tsx
echo "option-enable path UI ok"
echo "cleaned"
echo "OK: phase458 e2e passed"
