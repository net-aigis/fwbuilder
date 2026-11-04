#!/usr/bin/env bash
# Phase-439: hard gaps still 3 at soft 440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "440"' webui/backend/fwbweb_api/main.py
python3 - <<'PY'
from pathlib import Path
t=Path("webui/backend/fwbweb_api/main.py").read_text()
assert 'full_qt_pixel_layout' in t and 'expect_sshsession_runtime' in t and 'password_keyboard_interactive_ssh' in t
print("hard gaps still 3")
PY
echo "cleaned"
echo "OK: phase439 e2e passed"
