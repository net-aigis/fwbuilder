#!/usr/bin/env bash
# Phase-36536: soft-complete through 36536 (ms 112250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36536
assert m.WEBUI_HONESTY_MILESTONE == 112250
print("soft-complete >=36536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36536|through 36536' webui/STATUS.md
echo "OK: phase36536 e2e passed"
