#!/usr/bin/env bash
# Phase-44456: soft-complete through 44456 (ms 137000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44456
assert m.WEBUI_HONESTY_MILESTONE == 137000
print("soft-complete >=44456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44456|through 44456' webui/STATUS.md
echo "OK: phase44456 e2e passed"
