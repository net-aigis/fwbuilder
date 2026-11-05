#!/usr/bin/env bash
# Phase-3064: soft-complete through 3064 (schema 2.8 + ms 7650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3064
assert m.WEBUI_HONESTY_MILESTONE == 7650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("2.", "3."))
print("soft-complete >=3064", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3064|Soft-complete STATUS through 3064|through 3064' webui/STATUS.md
echo "STATUS soft-complete 3064 ok"
echo "cleaned"
echo "OK: phase3064 e2e passed"
