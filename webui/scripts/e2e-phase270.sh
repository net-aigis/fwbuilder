#!/usr/bin/env bash
# Phase-270: 265–269 wiring smoke.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option-section-flat' webui/frontend/src/styles/app.css
grep -Fq 'layout_tree' webui/scripts/extract-dialog-fields.py
grep -Fq 'expect_install_walkthrough' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'password_probe_path' webui/backend/fwbweb_api/routes/platforms.py
echo "265-269 wiring ok"
echo "cleaned"
echo "OK: phase270 e2e passed"
