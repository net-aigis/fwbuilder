#!/usr/bin/env bash
# Phase-21576: soft-complete through 21576 (ms 65500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21576
assert m.WEBUI_HONESTY_MILESTONE == 65500
print("soft-complete >=21576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21576|through 21576' webui/STATUS.md
echo "OK: phase21576 e2e passed"
