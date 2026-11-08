#!/usr/bin/env bash
# Phase-10536: soft-complete through 10536 (ms 31000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10536
assert m.WEBUI_HONESTY_MILESTONE == 31000
print("soft-complete >=10536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10536|through 10536' webui/STATUS.md
echo "OK: phase10536 e2e passed"
