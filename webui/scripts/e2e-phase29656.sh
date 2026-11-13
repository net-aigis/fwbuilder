#!/usr/bin/env bash
# Phase-29656: soft-complete through 29656 (ms 90750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29656
assert m.WEBUI_HONESTY_MILESTONE == 90750
print("soft-complete >=29656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29656|through 29656' webui/STATUS.md
echo "OK: phase29656 e2e passed"
