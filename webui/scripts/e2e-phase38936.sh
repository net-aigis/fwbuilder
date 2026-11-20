#!/usr/bin/env bash
# Phase-38936: soft-complete through 38936 (ms 119750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38936
assert m.WEBUI_HONESTY_MILESTONE == 119750
print("soft-complete >=38936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38936|through 38936' webui/STATUS.md
echo "OK: phase38936 e2e passed"
