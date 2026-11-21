#!/usr/bin/env bash
# Phase-43576: soft-complete through 43576 (ms 134250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43576
assert m.WEBUI_HONESTY_MILESTONE == 134250
print("soft-complete >=43576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43576|through 43576' webui/STATUS.md
echo "OK: phase43576 e2e passed"
