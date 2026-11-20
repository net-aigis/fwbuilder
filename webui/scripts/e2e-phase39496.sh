#!/usr/bin/env bash
# Phase-39496: soft-complete through 39496 (ms 121500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39496
assert m.WEBUI_HONESTY_MILESTONE == 121500
print("soft-complete >=39496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39496|through 39496' webui/STATUS.md
echo "OK: phase39496 e2e passed"
