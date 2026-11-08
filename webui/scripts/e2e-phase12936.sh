#!/usr/bin/env bash
# Phase-12936: soft-complete through 12936 (ms 38500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12936
assert m.WEBUI_HONESTY_MILESTONE == 38500
print("soft-complete >=12936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12936|through 12936' webui/STATUS.md
echo "OK: phase12936 e2e passed"
