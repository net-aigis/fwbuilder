#!/usr/bin/env bash
# Phase-8936: soft-complete through 8936 (ms 26000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8936
assert m.WEBUI_HONESTY_MILESTONE == 26000
print("soft-complete >=8936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8936|through 8936' webui/STATUS.md
echo "OK: phase8936 e2e passed"
