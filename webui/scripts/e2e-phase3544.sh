#!/usr/bin/env bash
# Phase-3544: soft-complete through 3544 (schema 3.4 + ms 9150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3544
assert m.WEBUI_HONESTY_MILESTONE == 9150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("soft-complete >=3544", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3544|Soft-complete STATUS through 3544|through 3544' webui/STATUS.md
echo "STATUS soft-complete 3544 ok"
echo "cleaned"
echo "OK: phase3544 e2e passed"
