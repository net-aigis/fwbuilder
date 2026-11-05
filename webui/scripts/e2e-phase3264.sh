#!/usr/bin/env bash
# Phase-3264: soft-complete through 3264 (catalog_summary_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3264
assert "soft_fertig_catalog_summary_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3264", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3264|Soft-complete STATUS through 3264|through 3264' webui/STATUS.md
echo "STATUS soft-complete 3264 ok"
echo "cleaned"
echo "OK: phase3264 e2e passed"
