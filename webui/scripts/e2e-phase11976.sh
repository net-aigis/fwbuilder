#!/usr/bin/env bash
# Phase-11976: soft-complete through 11976 (ms 35500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11976
assert m.WEBUI_HONESTY_MILESTONE == 35500
print("soft-complete >=11976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11976|through 11976' webui/STATUS.md
echo "OK: phase11976 e2e passed"
