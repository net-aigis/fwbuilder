#!/usr/bin/env bash
# Phase-3737: soft_fertig_hard_gaps_closure_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_HARD_GAPS_CLOSURE_KEYS)
assert expected == 70
r = m.soft_fertig_hard_gaps_closure_roster()
assert r.get("entry_count") == expected
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == expected
assert all("id" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_hard_gaps_closure_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_hard_gaps_closure_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_hard_gaps_closure_roster") or {}).get(
    "hard_gaps_remain"
) is True
cs = m.soft_fertig_catalog_summary()
assert cs.get("soft_fertig_hard_gaps_closure_roster_entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3744
print("hard_gaps_closure_roster ok", expected)
PY
echo "cleaned"
echo "OK: phase3737 e2e passed"
