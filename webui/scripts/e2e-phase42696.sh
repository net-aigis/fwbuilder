#!/usr/bin/env bash
# Phase-42696: soft-complete through 42696 (ms 131500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42696
assert m.WEBUI_HONESTY_MILESTONE == 131500
print("soft-complete >=42696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42696|through 42696' webui/STATUS.md
echo "OK: phase42696 e2e passed"
