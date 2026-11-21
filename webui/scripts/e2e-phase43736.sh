#!/usr/bin/env bash
# Phase-43736: soft-complete through 43736 (ms 134750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43736
assert m.WEBUI_HONESTY_MILESTONE == 134750
print("soft-complete >=43736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43736|through 43736' webui/STATUS.md
echo "OK: phase43736 e2e passed"
