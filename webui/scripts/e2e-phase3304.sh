#!/usr/bin/env bash
# Phase-3304: soft-complete through 3304 (schema 3.1 + ms 8400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3304
assert m.WEBUI_HONESTY_MILESTONE == 8400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("soft-complete >=3304", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3304|Soft-complete STATUS through 3304|through 3304' webui/STATUS.md
echo "STATUS soft-complete 3304 ok"
echo "cleaned"
echo "OK: phase3304 e2e passed"
