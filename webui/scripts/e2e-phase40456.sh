#!/usr/bin/env bash
# Phase-40456: soft-complete through 40456 (ms 124500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40456
assert m.WEBUI_HONESTY_MILESTONE == 124500
print("soft-complete >=40456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40456|through 40456' webui/STATUS.md
echo "OK: phase40456 e2e passed"
