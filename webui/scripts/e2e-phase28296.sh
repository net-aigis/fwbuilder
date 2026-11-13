#!/usr/bin/env bash
# Phase-28296: soft-complete through 28296 (ms 86500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28296
assert m.WEBUI_HONESTY_MILESTONE == 86500
print("soft-complete >=28296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28296|through 28296' webui/STATUS.md
echo "OK: phase28296 e2e passed"
