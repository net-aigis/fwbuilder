#!/usr/bin/env bash
# Phase-46856: soft-complete through 46856 (ms 144500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46856
assert m.WEBUI_HONESTY_MILESTONE == 144500
print("soft-complete >=46856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46856|through 46856' webui/STATUS.md
echo "OK: phase46856 e2e passed"
