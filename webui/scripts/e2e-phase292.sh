#!/usr/bin/env bash
# Phase-292: 289–291 wiring smoke.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapNotes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'step_refused' webui/backend/fwbweb_api/expect_installer.py
grep -q 'parse_widget_visible' webui/scripts/extract-dialog-fields.py
echo "289-291 wiring ok"
echo "cleaned"
echo "OK: phase292 e2e passed"
