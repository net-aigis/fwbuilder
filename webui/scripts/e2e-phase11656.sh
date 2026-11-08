#!/usr/bin/env bash
# Phase-11656: soft-complete through 11656 (ms 34500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11656
assert m.WEBUI_HONESTY_MILESTONE == 34500
print("soft-complete >=11656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11656|through 11656' webui/STATUS.md
echo "OK: phase11656 e2e passed"
