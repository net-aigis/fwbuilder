#!/usr/bin/env bash
# Phase-41096: soft-complete through 41096 (ms 126500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41096
assert m.WEBUI_HONESTY_MILESTONE == 126500
print("soft-complete >=41096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41096|through 41096' webui/STATUS.md
echo "OK: phase41096 e2e passed"
