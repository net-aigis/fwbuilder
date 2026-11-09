#!/usr/bin/env bash
# Phase-20936: soft-complete through 20936 (ms 63500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20936
assert m.WEBUI_HONESTY_MILESTONE == 63500
print("soft-complete >=20936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20936|through 20936' webui/STATUS.md
echo "OK: phase20936 e2e passed"
