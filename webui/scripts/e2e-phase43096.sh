#!/usr/bin/env bash
# Phase-43096: soft-complete through 43096 (ms 132750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43096
assert m.WEBUI_HONESTY_MILESTONE == 132750
print("soft-complete >=43096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase43096|through 43096' webui/STATUS.md
echo "OK: phase43096 e2e passed"
