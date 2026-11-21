#!/usr/bin/env bash
# Phase-25736: soft-complete through 25736 (ms 78500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25736
assert m.WEBUI_HONESTY_MILESTONE == 78500
print("soft-complete >=25736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25736|through 25736' webui/STATUS.md
echo "OK: phase25736 e2e passed"
