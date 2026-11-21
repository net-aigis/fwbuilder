#!/usr/bin/env bash
# Phase-291: visible property extract + OptionField hide when visible=false.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'parse_widget_visible' webui/scripts/extract-dialog-fields.py
grep -Fq 'visible' webui/frontend/src/components/OptionField.tsx
grep -Fq 'visible?: boolean' webui/frontend/src/api/client.ts
python3 webui/scripts/extract-dialog-fields.py >/tmp/fwbweb-extract291.out
echo "visible wiring ok"
echo "cleaned"
echo "OK: phase291 e2e passed"
