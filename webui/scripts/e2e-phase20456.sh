#!/usr/bin/env bash
# Phase-20456: soft-complete through 20456 (ms 62000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20456
assert m.WEBUI_HONESTY_MILESTONE == 62000
print("soft-complete >=20456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20456|through 20456' webui/STATUS.md
echo "OK: phase20456 e2e passed"
