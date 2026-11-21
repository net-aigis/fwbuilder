#!/usr/bin/env bash
# Phase-4057: soft_fertig_layout_fidelity_roster on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_LAYOUT_FIDELITY_KEYS)
assert expected == 15
r = m.soft_fertig_layout_fidelity_roster()
assert r.get("entry_count") == expected
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == expected
assert all("id" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_layout_fidelity_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_layout_fidelity_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_layout_fidelity_roster") or {}).get("hard_gaps_remain") is True
cs = m.soft_fertig_catalog_summary()
assert cs.get("soft_fertig_layout_fidelity_roster_entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4064
print("layout_fidelity_roster ok", expected)
PY
echo "cleaned"
echo "OK: phase4057 e2e passed"
