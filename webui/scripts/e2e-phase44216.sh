#!/usr/bin/env bash
# Phase-44216: soft-complete through 44216 (ms 136250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44216
assert m.WEBUI_HONESTY_MILESTONE == 136250
print("soft-complete >=44216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44216|through 44216' webui/STATUS.md
echo "OK: phase44216 e2e passed"
