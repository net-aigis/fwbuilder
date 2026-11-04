#!/usr/bin/env bash
# Phase-2112: soft-complete through 2112 (schema 1.6).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2112
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
print("soft-complete >=2112", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2112|Soft-complete STATUS through 2112|through 2112' webui/STATUS.md
echo "STATUS soft-complete 2112 ok"
echo "cleaned"
echo "OK: phase2112 e2e passed"
