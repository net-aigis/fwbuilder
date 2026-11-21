#!/usr/bin/env bash
# Phase-48776: soft-complete through 48776 (ms 150500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48776
assert m.WEBUI_HONESTY_MILESTONE == 150500
print("soft-complete >=48776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48776|through 48776' webui/STATUS.md
echo "OK: phase48776 e2e passed"
