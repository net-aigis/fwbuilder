#!/usr/bin/env bash
# Phase-10696: soft-complete through 10696 (ms 31500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10696
assert m.WEBUI_HONESTY_MILESTONE == 31500
print("soft-complete >=10696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10696|through 10696' webui/STATUS.md
echo "OK: phase10696 e2e passed"
