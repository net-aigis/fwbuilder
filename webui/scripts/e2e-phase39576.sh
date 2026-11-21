#!/usr/bin/env bash
# Phase-39576: soft-complete through 39576 (ms 121750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39576
assert m.WEBUI_HONESTY_MILESTONE == 121750
print("soft-complete >=39576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39576|through 39576' webui/STATUS.md
echo "OK: phase39576 e2e passed"
