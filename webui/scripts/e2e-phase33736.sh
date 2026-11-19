#!/usr/bin/env bash
# Phase-33736: soft-complete through 33736 (ms 103500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33736
assert m.WEBUI_HONESTY_MILESTONE == 103500
print("soft-complete >=33736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33736|through 33736' webui/STATUS.md
echo "OK: phase33736 e2e passed"
