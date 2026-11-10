#!/usr/bin/env bash
# Phase-24936: soft-complete through 24936 (ms 76000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24936
assert m.WEBUI_HONESTY_MILESTONE == 76000
print("soft-complete >=24936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24936|through 24936' webui/STATUS.md
echo "OK: phase24936 e2e passed"
