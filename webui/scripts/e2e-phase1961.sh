#!/usr/bin/env bash
# Phase-1961: catalog_summary soft_fertig_catalogs_complete + hard_gaps_remain.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
s = m.soft_fertig_catalog_summary()
assert s.get("soft_fertig_catalogs_complete") is True
assert s.get("hard_gaps_remain") is True
assert s.get("hard_gap_count") == 3
h = m.hard_gaps()
cs = h.get("soft_fertig_catalog_summary") or {}
assert cs.get("soft_fertig_catalogs_complete") is True
assert cs.get("hard_gaps_remain") is True
assert (m.health().get("soft_fertig_catalog_summary") or {}).get("hard_gaps_remain") is True
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1968
print("catalog_summary readiness flags ok")
PY
echo "cleaned"
echo "OK: phase1961 e2e passed"
