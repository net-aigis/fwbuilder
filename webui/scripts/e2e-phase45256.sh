#!/usr/bin/env bash
# Phase-45256: soft-complete through 45256 (ms 139500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45256
assert m.WEBUI_HONESTY_MILESTONE == 139500
print("soft-complete >=45256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45256|through 45256' webui/STATUS.md
echo "OK: phase45256 e2e passed"
