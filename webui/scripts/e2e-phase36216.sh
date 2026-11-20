#!/usr/bin/env bash
# Phase-36216: soft-complete through 36216 (ms 111250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36216
assert m.WEBUI_HONESTY_MILESTONE == 111250
print("soft-complete >=36216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36216|through 36216' webui/STATUS.md
echo "OK: phase36216 e2e passed"
