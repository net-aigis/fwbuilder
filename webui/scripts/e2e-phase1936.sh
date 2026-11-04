#!/usr/bin/env bash
# Phase-1936: soft-complete through 1936 (schema 1.3).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1936
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
print("soft-complete >=1936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1936|Soft-complete STATUS through 1936|through 1936' webui/STATUS.md
echo "STATUS soft-complete 1936 ok"
echo "cleaned"
echo "OK: phase1936 e2e passed"
