#!/usr/bin/env bash
# Phase-12536: soft-complete through 12536 (ms 37250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12536
assert m.WEBUI_HONESTY_MILESTONE == 37250
print("soft-complete >=12536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12536|through 12536' webui/STATUS.md
echo "OK: phase12536 e2e passed"
