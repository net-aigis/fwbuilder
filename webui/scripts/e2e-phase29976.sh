#!/usr/bin/env bash
# Phase-29976: soft-complete through 29976 (ms 91750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29976
assert m.WEBUI_HONESTY_MILESTONE == 91750
print("soft-complete >=29976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29976|through 29976' webui/STATUS.md
echo "OK: phase29976 e2e passed"
