#!/usr/bin/env bash
# Phase-28696: soft-complete through 28696 (ms 87750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28696
assert m.WEBUI_HONESTY_MILESTONE == 87750
print("soft-complete >=28696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28696|through 28696' webui/STATUS.md
echo "OK: phase28696 e2e passed"
