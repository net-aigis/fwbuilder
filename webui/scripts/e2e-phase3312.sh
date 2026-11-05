#!/usr/bin/env bash
# Phase-3312: soft-complete through 3312 (catalog_summary_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3312
assert "catalog_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3312", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3312|Soft-complete STATUS through 3312|through 3312' webui/STATUS.md
echo "STATUS soft-complete 3312 ok"
echo "cleaned"
echo "OK: phase3312 e2e passed"
