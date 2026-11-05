#!/usr/bin/env bash
# Phase-3257: soft_fertig_catalog_summary_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_CATALOG_SUMMARY_KEYS)
assert expected == 29
r = m.soft_fertig_catalog_summary_roster()
assert r.get("entry_count") == expected
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == expected
assert all("id" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_catalog_summary_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_catalog_summary_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_catalog_summary_roster") or {}).get(
    "hard_gaps_remain"
) is True
cs = m.soft_fertig_catalog_summary()
assert cs.get("soft_fertig_catalog_summary_roster_entry_count") == expected
assert set(cs.keys()) == set(m.SOFT_FERTIG_CATALOG_SUMMARY_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3264
print("catalog_summary_roster ok", expected)
PY
echo "cleaned"
echo "OK: phase3257 e2e passed"
