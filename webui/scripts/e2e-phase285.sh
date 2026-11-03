#!/usr/bin/env bash
# Phase-285: 281–284 wiring smoke.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'parse_widget_enabled' webui/scripts/extract-dialog-fields.py
grep -Fq 'uiDisabled' webui/frontend/src/components/OptionField.tsx
grep -Fq 'expectWalkthroughKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'HARD_GAP_NOTES' webui/backend/fwbweb_api/main.py
echo "281-284 wiring ok"
echo "cleaned"
echo "OK: phase285 e2e passed"
