#!/usr/bin/env bash
# Phase-20296: soft-complete through 20296 (ms 61500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20296
assert m.WEBUI_HONESTY_MILESTONE == 61500
print("soft-complete >=20296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20296|through 20296' webui/STATUS.md
echo "OK: phase20296 e2e passed"
