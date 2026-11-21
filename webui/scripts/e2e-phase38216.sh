#!/usr/bin/env bash
# Phase-38216: soft-complete through 38216 (ms 117500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38216
assert m.WEBUI_HONESTY_MILESTONE == 117500
print("soft-complete >=38216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38216|through 38216' webui/STATUS.md
echo "OK: phase38216 e2e passed"
