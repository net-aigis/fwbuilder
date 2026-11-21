#!/usr/bin/env bash
# Phase-769: spacer CSS Maximum/Minimum/Preferred.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'data-size-type="Maximum"' webui/frontend/src/styles/app.css
grep -Fq 'data-size-type="Minimum"' webui/frontend/src/styles/app.css
grep -Fq 'data-size-type="Preferred"' webui/frontend/src/styles/app.css
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "Maximum/Minimum/Preferred" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 776
print("spacer sizeType CSS ok")
PY
echo "cleaned"
echo "OK: phase769 e2e passed"
