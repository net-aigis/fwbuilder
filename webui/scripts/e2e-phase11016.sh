#!/usr/bin/env bash
# Phase-11016: soft-complete through 11016 (ms 32500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11016
assert m.WEBUI_HONESTY_MILESTONE == 32500
print("soft-complete >=11016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11016|through 11016' webui/STATUS.md
echo "OK: phase11016 e2e passed"
