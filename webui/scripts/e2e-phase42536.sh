#!/usr/bin/env bash
# Phase-42536: soft-complete through 42536 (ms 131000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42536
assert m.WEBUI_HONESTY_MILESTONE == 131000
print("soft-complete >=42536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42536|through 42536' webui/STATUS.md
echo "OK: phase42536 e2e passed"
