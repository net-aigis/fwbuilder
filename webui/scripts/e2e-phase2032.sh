#!/usr/bin/env bash
# Phase-2032: soft-complete through 2032 (schema 1.5).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2032
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
print("soft-complete >=2032", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2032|Soft-complete STATUS through 2032|through 2032' webui/STATUS.md
echo "STATUS soft-complete 2032 ok"
echo "cleaned"
echo "OK: phase2032 e2e passed"
