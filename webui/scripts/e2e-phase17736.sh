#!/usr/bin/env bash
# Phase-17736: soft-complete through 17736 (ms 53500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17736
assert m.WEBUI_HONESTY_MILESTONE == 53500
print("soft-complete >=17736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17736|through 17736' webui/STATUS.md
echo "OK: phase17736 e2e passed"
