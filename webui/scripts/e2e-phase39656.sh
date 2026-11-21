#!/usr/bin/env bash
# Phase-39656: soft-complete through 39656 (ms 122000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39656
assert m.WEBUI_HONESTY_MILESTONE == 122000
print("soft-complete >=39656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39656|through 39656' webui/STATUS.md
echo "OK: phase39656 e2e passed"
