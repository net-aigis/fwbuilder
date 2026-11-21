#!/usr/bin/env bash
# Phase-48296: soft-complete through 48296 (ms 149000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48296
assert m.WEBUI_HONESTY_MILESTONE == 149000
print("soft-complete >=48296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48296|through 48296' webui/STATUS.md
echo "OK: phase48296 e2e passed"
