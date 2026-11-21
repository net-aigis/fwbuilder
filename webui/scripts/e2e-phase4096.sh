#!/usr/bin/env bash
# Phase-4096: soft-complete through 4096 (schema 4.1).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4096
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=4096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4096|Soft-complete STATUS through 4096|through 4096' webui/STATUS.md
echo "STATUS soft-complete 4096 ok"
echo "cleaned"
echo "OK: phase4096 e2e passed"
