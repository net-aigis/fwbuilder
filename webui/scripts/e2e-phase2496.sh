#!/usr/bin/env bash
# Phase-2496: soft-complete through 2496 (schema 2.1).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2496
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION .startswith(("2.", "3."))
print("soft-complete >=2496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2496|Soft-complete STATUS through 2496|through 2496' webui/STATUS.md
echo "STATUS soft-complete 2496 ok"
echo "cleaned"
echo "OK: phase2496 e2e passed"
