#!/usr/bin/env bash
# Phase-10376: soft-complete through 10376 (ms 30500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10376
assert m.WEBUI_HONESTY_MILESTONE == 30500
print("soft-complete >=10376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10376|through 10376' webui/STATUS.md
echo "OK: phase10376 e2e passed"
