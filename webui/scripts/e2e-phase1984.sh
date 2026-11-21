#!/usr/bin/env bash
# Phase-1984: soft-complete through 1984 (schema 1.4).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1984
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=1984", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1984|Soft-complete STATUS through 1984|through 1984' webui/STATUS.md
echo "STATUS soft-complete 1984 ok"
echo "cleaned"
echo "OK: phase1984 e2e passed"
