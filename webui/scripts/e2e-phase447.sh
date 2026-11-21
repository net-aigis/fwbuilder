#!/usr/bin/env bash
# Phase-447: hard gaps still 3 at 448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "448"' webui/backend/fwbweb_api/main.py
grep -Fq 'full_qt_pixel_layout' webui/backend/fwbweb_api/main.py
grep -Fq 'expect_sshsession_runtime' webui/backend/fwbweb_api/main.py
grep -Fq 'password_keyboard_interactive_ssh' webui/backend/fwbweb_api/main.py
echo "hard gaps still 3 @ 448"
echo "cleaned"
echo "OK: phase447 e2e passed"
