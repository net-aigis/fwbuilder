#!/usr/bin/env bash
# Phase-1769: catalog summary still on API for UI detail.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
s = h.get("soft_fertig_catalog_summary") or {}
assert int(s.get("soft_fertig_surface_key_count") or 0) >= 44
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1776
print("catalog summary data ok")
PY
echo "cleaned"
echo "OK: phase1769 e2e passed"
