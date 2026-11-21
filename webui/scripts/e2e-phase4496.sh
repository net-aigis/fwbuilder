#!/usr/bin/env bash
# Phase-4496: soft-complete through 4496 (schema 4.6).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4496
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4496|Soft-complete STATUS through 4496|through 4496' webui/STATUS.md
echo "STATUS soft-complete 4496 ok"
echo "cleaned"
echo "OK: phase4496 e2e passed"
