#!/usr/bin/env bash
# Phase-745: CSS size-h/v Minimum and Preferred.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'size-h-Minimum' webui/frontend/src/styles/app.css
grep -Fq 'size-h-Preferred' webui/frontend/src/styles/app.css
grep -Fq 'size-v-Minimum' webui/frontend/src/styles/app.css
grep -Fq 'size-v-Preferred' webui/frontend/src/styles/app.css
grep -Fq 'size-v-Fixed' webui/frontend/src/styles/app.css
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "Minimum/Preferred/Fixed" in (m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or "")
assert m.WEBUI_SOFT_COMPLETE_PHASE == "752"
print("size policy CSS ok")
PY
echo "cleaned"
echo "OK: phase745 e2e passed"
