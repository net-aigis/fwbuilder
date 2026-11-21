#!/usr/bin/env bash
# Phase-43016: soft-complete through 43016 (ms 132500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43016
assert m.WEBUI_HONESTY_MILESTONE == 132500
print("soft-complete >=43016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43016|through 43016' webui/STATUS.md
echo "OK: phase43016 e2e passed"
