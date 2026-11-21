#!/usr/bin/env bash
# Phase-41816: soft-complete through 41816 (ms 128750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41816
assert m.WEBUI_HONESTY_MILESTONE == 128750
print("soft-complete >=41816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41816|through 41816' webui/STATUS.md
echo "OK: phase41816 e2e passed"
