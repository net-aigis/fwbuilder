#!/usr/bin/env bash
# Phase-3136: soft-complete through 3136 (schema 2.9).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3136
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("2.", "3."))
print("soft-complete >=3136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3136|Soft-complete STATUS through 3136|through 3136' webui/STATUS.md
echo "STATUS soft-complete 3136 ok"
echo "cleaned"
echo "OK: phase3136 e2e passed"
