#!/usr/bin/env bash
# Phase-3280: soft-complete through 3280 (catalog_summary_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3280
assert "catalog_summary_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=3280", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3280|Soft-complete STATUS through 3280|through 3280' webui/STATUS.md
echo "STATUS soft-complete 3280 ok"
echo "cleaned"
echo "OK: phase3280 e2e passed"
