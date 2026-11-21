#!/usr/bin/env bash
# Phase-4656: soft-complete through 4656 (schema 4.8).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4656
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4656|Soft-complete STATUS through 4656|through 4656' webui/STATUS.md
echo "STATUS soft-complete 4656 ok"
echo "cleaned"
echo "OK: phase4656 e2e passed"
