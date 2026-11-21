#!/usr/bin/env bash
# Phase-262: 257–261 wiring smoke (extract + expect + frontend helpers).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'size_hint' webui/scripts/extract-dialog-fields.py
grep -Fq 'rowsFromStretch' webui/frontend/src/qtGrid.ts
grep -Fq 'qtAlignmentStyle' webui/frontend/src/qtGrid.ts
grep -Fq 'safety_net_acl' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'related_names' webui/backend/fwbweb_api/configlets.py
echo "257-261 wiring ok"
echo "cleaned"
echo "OK: phase262 e2e passed"
