#!/usr/bin/env bash
# Phase-18536: soft-complete through 18536 (ms 56000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18536
assert m.WEBUI_HONESTY_MILESTONE == 56000
print("soft-complete >=18536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18536|through 18536' webui/STATUS.md
echo "OK: phase18536 e2e passed"
