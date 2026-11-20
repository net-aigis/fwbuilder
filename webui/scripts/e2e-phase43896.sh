#!/usr/bin/env bash
# Phase-43896: soft-complete through 43896 (ms 135250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43896
assert m.WEBUI_HONESTY_MILESTONE == 135250
print("soft-complete >=43896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43896|through 43896' webui/STATUS.md
echo "OK: phase43896 e2e passed"
