#!/usr/bin/env bash
# Phase-3017: soft_fertig_layout_fidelity_signal_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = sum(len(v) for v in m.SOFT_FERTIG_LAYOUT_FIDELITY_SIGNAL_GROUPS.values())
assert expected == 41
r = m.soft_fertig_layout_fidelity_signal_roster()
assert r.get("entry_count") == expected
assert r.get("group_count") == len(m.SOFT_FERTIG_LAYOUT_FIDELITY_SIGNAL_GROUPS)
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == expected
assert all("id" in e and "group" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_layout_fidelity_signal_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_layout_fidelity_signal_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_layout_fidelity_signal_roster") or {}).get(
    "hard_gaps_remain"
) is True
assert "soft_fertig_layout_fidelity_signal_roster_entry_count" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3024
print("layout_fidelity_signal_roster ok", expected)
PY
echo "cleaned"
echo "OK: phase3017 e2e passed"
