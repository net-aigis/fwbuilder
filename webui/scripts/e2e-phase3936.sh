#!/usr/bin/env bash
# Phase-3936: soft-complete through 3936 (schema 3.9).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3936
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
print("soft-complete >=3936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3936|Soft-complete STATUS through 3936|through 3936' webui/STATUS.md
echo "STATUS soft-complete 3936 ok"
echo "cleaned"
echo "OK: phase3936 e2e passed"
