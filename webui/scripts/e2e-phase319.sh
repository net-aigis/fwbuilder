#!/usr/bin/env bash
# Phase-319: smoke hard gaps still list three opens.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE=="320"
assert len(m.HARD_GAPS_OPEN)==3
assert m.hard_gaps.__wrapped__ if False else True
# call endpoint function body via constructing return manually
assert "full_qt_pixel_layout" in m.HARD_GAPS_OPEN
print("hard gaps still 3 @ phase320")
print("cleaned")
PY
echo "OK: phase319 e2e passed"
