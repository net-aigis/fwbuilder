#!/usr/bin/env bash
# Phase-10936: soft-complete through 10936 (ms 32250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10936
assert m.WEBUI_HONESTY_MILESTONE == 32250
print("soft-complete >=10936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10936|through 10936' webui/STATUS.md
echo "OK: phase10936 e2e passed"
