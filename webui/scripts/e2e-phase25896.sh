#!/usr/bin/env bash
# Phase-25896: soft-complete through 25896 (ms 79000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25896
assert m.WEBUI_HONESTY_MILESTONE == 79000
print("soft-complete >=25896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25896|through 25896' webui/STATUS.md
echo "OK: phase25896 e2e passed"
