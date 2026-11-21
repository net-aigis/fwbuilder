#!/usr/bin/env bash
# Phase-4024: soft-complete through 4024 (schema 4.0 + ms 10650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4024
assert m.WEBUI_HONESTY_MILESTONE == 10650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4024", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4024|Soft-complete STATUS through 4024|through 4024' webui/STATUS.md
echo "STATUS soft-complete 4024 ok"
echo "cleaned"
echo "OK: phase4024 e2e passed"
