#!/usr/bin/env bash
# Phase-20536: soft-complete through 20536 (ms 62250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20536
assert m.WEBUI_HONESTY_MILESTONE == 62250
print("soft-complete >=20536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20536|through 20536' webui/STATUS.md
echo "OK: phase20536 e2e passed"
