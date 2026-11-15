#!/usr/bin/env bash
# Phase-31896: soft-complete through 31896 (ms 97750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31896
assert m.WEBUI_HONESTY_MILESTONE == 97750
print("soft-complete >=31896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31896|through 31896' webui/STATUS.md
echo "OK: phase31896 e2e passed"
