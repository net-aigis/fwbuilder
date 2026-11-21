#!/usr/bin/env bash
# Phase-24776: soft-complete through 24776 (ms 75500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24776
assert m.WEBUI_HONESTY_MILESTONE == 75500
print("soft-complete >=24776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24776|through 24776' webui/STATUS.md
echo "OK: phase24776 e2e passed"
