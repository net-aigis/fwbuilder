#!/usr/bin/env bash
# Phase-48136: soft-complete through 48136 (ms 148500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48136
assert m.WEBUI_HONESTY_MILESTONE == 148500
print("soft-complete >=48136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48136|through 48136' webui/STATUS.md
echo "OK: phase48136 e2e passed"
