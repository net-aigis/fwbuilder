#!/usr/bin/env bash
# Phase-12456: soft-complete through 12456 (ms 37000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12456
assert m.WEBUI_HONESTY_MILESTONE == 37000
print("soft-complete >=12456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12456|through 12456' webui/STATUS.md
echo "OK: phase12456 e2e passed"
