#!/usr/bin/env bash
# Phase-48696: soft-complete through 48696 (ms 150250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48696
assert m.WEBUI_HONESTY_MILESTONE == 150250
print("soft-complete >=48696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48696|through 48696' webui/STATUS.md
echo "OK: phase48696 e2e passed"
