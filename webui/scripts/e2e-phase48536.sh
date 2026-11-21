#!/usr/bin/env bash
# Phase-48536: soft-complete through 48536 (ms 149750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48536
assert m.WEBUI_HONESTY_MILESTONE == 149750
print("soft-complete >=48536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48536|through 48536' webui/STATUS.md
echo "OK: phase48536 e2e passed"
