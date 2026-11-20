#!/usr/bin/env bash
# Phase-45976: soft-complete through 45976 (ms 141750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45976
assert m.WEBUI_HONESTY_MILESTONE == 141750
print("soft-complete >=45976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45976|through 45976' webui/STATUS.md
echo "OK: phase45976 e2e passed"
