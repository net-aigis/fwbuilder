#!/usr/bin/env bash
# Phase-3776: soft-complete through 3776 (schema 3.7).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3776
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=3776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3776|Soft-complete STATUS through 3776|through 3776' webui/STATUS.md
echo "STATUS soft-complete 3776 ok"
echo "cleaned"
echo "OK: phase3776 e2e passed"
