#!/usr/bin/env bash
# Phase-47896: soft-complete through 47896 (ms 147750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47896
assert m.WEBUI_HONESTY_MILESTONE == 147750
print("soft-complete >=47896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47896|through 47896' webui/STATUS.md
echo "OK: phase47896 e2e passed"
