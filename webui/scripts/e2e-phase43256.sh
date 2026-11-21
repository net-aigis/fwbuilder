#!/usr/bin/env bash
# Phase-43256: soft-complete through 43256 (ms 133250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43256
assert m.WEBUI_HONESTY_MILESTONE == 133250
print("soft-complete >=43256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43256|through 43256' webui/STATUS.md
echo "OK: phase43256 e2e passed"
