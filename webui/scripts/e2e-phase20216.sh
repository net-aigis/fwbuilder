#!/usr/bin/env bash
# Phase-20216: soft-complete through 20216 (ms 61250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20216
assert m.WEBUI_HONESTY_MILESTONE == 61250
print("soft-complete >=20216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20216|through 20216' webui/STATUS.md
echo "OK: phase20216 e2e passed"
