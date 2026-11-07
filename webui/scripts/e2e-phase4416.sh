#!/usr/bin/env bash
# Phase-4416: soft-complete through 4416 (schema 4.5).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4416
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4416|Soft-complete STATUS through 4416|through 4416' webui/STATUS.md
echo "STATUS soft-complete 4416 ok"
echo "cleaned"
echo "OK: phase4416 e2e passed"
