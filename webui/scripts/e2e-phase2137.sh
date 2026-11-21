#!/usr/bin/env bash
# Phase-2137: soft_fertig_honesty_operator_brief on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
b = m.soft_fertig_honesty_operator_brief()
assert b.get("soft_fertig_catalogs_complete") is True
assert b.get("hard_gaps_remain") is True
assert b.get("hard_gap_count") == 3
assert "summary" in b and "Soft-fertig" in str(b.get("summary") or "")
assert "soft_fertig_honesty_operator_brief" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_operator_brief") or {}).get("hard_gap_count") == 3
assert (m.health().get("soft_fertig_honesty_operator_brief") or {}).get("hard_gaps_remain") is True
assert "soft_fertig_honesty_operator_brief_summary" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2144
print("honesty operator brief ok")
PY
echo "cleaned"
echo "OK: phase2137 e2e passed"
