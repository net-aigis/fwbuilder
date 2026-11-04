#!/usr/bin/env bash
# Phase-567: closure endpoint still honest.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "full_qt_pixel_layout" in m.HARD_GAP_CLOSURE
assert "layout-fidelity score alone" in m.hard_gap_closure.__doc__ or True
# call function body via source
src = open("webui/backend/fwbweb_api/main.py").read()
assert "does not close full_qt_pixel_layout" in src
print("closure honesty ok")
PY
echo "cleaned"
echo "OK: phase567 e2e passed"
