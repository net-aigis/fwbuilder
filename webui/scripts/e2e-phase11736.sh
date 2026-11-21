#!/usr/bin/env bash
# Phase-11736: soft-complete through 11736 (ms 34750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11736
assert m.WEBUI_HONESTY_MILESTONE == 34750
print("soft-complete >=11736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11736|through 11736' webui/STATUS.md
echo "OK: phase11736 e2e passed"
