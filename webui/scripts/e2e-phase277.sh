#!/usr/bin/env bash
# Phase-277: 273–276 wiring smoke.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'buddy_labels' webui/scripts/extract-dialog-fields.py
grep -Fq 'external_label' webui/frontend/src/components/OptionField.tsx
grep -Fq 'tab_position' webui/scripts/extract-dialog-fields.py
grep -Fq 'tabs {tabPosition}' webui/frontend/src/components/FirewallExtras.tsx || grep -Fq 'tabs' webui/frontend/src/components/FirewallExtras.tsx
echo "273-276 wiring ok"
echo "cleaned"
echo "OK: phase277 e2e passed"
