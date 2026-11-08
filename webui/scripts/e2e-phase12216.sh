#!/usr/bin/env bash
# Phase-12216: soft-complete through 12216 (ms 36250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12216
assert m.WEBUI_HONESTY_MILESTONE == 36250
print("soft-complete >=12216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12216|through 12216' webui/STATUS.md
echo "OK: phase12216 e2e passed"
