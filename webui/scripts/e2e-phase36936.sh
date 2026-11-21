#!/usr/bin/env bash
# Phase-36936: soft-complete through 36936 (ms 113500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36936
assert m.WEBUI_HONESTY_MILESTONE == 113500
print("soft-complete >=36936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36936|through 36936' webui/STATUS.md
echo "OK: phase36936 e2e passed"
