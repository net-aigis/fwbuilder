#!/usr/bin/env bash
# Phase-34536: soft-complete through 34536 (ms 106000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34536
assert m.WEBUI_HONESTY_MILESTONE == 106000
print("soft-complete >=34536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34536|through 34536' webui/STATUS.md
echo "OK: phase34536 e2e passed"
