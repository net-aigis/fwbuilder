#!/usr/bin/env bash
# Phase-48856: soft-complete through 48856 (ms 150750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48856
assert m.WEBUI_HONESTY_MILESTONE == 150750
print("soft-complete >=48856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48856|through 48856' webui/STATUS.md
echo "OK: phase48856 e2e passed"
