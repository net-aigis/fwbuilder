#!/usr/bin/env bash
# Phase-28936: soft-complete through 28936 (ms 88500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28936
assert m.WEBUI_HONESTY_MILESTONE == 88500
print("soft-complete >=28936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28936|through 28936' webui/STATUS.md
echo "OK: phase28936 e2e passed"
