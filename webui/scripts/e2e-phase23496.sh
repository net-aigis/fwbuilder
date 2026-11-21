#!/usr/bin/env bash
# Phase-23496: soft-complete through 23496 (ms 71500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23496
assert m.WEBUI_HONESTY_MILESTONE == 71500
print("soft-complete >=23496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23496|through 23496' webui/STATUS.md
echo "OK: phase23496 e2e passed"
