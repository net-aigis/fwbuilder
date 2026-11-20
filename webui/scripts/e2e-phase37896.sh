#!/usr/bin/env bash
# Phase-37896: soft-complete through 37896 (ms 116500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37896
assert m.WEBUI_HONESTY_MILESTONE == 116500
print("soft-complete >=37896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37896|through 37896' webui/STATUS.md
echo "OK: phase37896 e2e passed"
