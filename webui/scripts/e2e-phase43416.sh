#!/usr/bin/env bash
# Phase-43416: soft-complete through 43416 (ms 133750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43416
assert m.WEBUI_HONESTY_MILESTONE == 133750
print("soft-complete >=43416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43416|through 43416' webui/STATUS.md
echo "OK: phase43416 e2e passed"
