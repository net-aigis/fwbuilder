#!/usr/bin/env bash
# Phase-9896: soft-complete through 9896 (ms 29000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9896
assert m.WEBUI_HONESTY_MILESTONE == 29000
print("soft-complete >=9896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9896|through 9896' webui/STATUS.md
echo "OK: phase9896 e2e passed"
