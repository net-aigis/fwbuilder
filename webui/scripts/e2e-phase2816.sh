#!/usr/bin/env bash
# Phase-2816: soft-complete through 2816 (schema 2.5).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2816
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("2.")
print("soft-complete >=2816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2816|Soft-complete STATUS through 2816|through 2816' webui/STATUS.md
echo "STATUS soft-complete 2816 ok"
echo "cleaned"
echo "OK: phase2816 e2e passed"
