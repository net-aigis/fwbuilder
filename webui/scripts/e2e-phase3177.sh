#!/usr/bin/env bash
# Phase-3177: soft_fertig_layout_fidelity_sample_field_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_LAYOUT_FIDELITY_SAMPLE_FIELD_KEYS)
assert expected == 49
r = m.soft_fertig_layout_fidelity_sample_field_roster()
assert r.get("entry_count") == expected
assert r.get("required_count") == len(m.SOFT_FERTIG_LAYOUT_FIDELITY_SAMPLE_KEYS)
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == expected
assert all("id" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_layout_fidelity_sample_field_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_layout_fidelity_sample_field_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_layout_fidelity_sample_field_roster") or {}).get(
    "hard_gaps_remain"
) is True
assert "soft_fertig_layout_fidelity_sample_field_roster_entry_count" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3184
print("layout_fidelity_sample_field_roster ok", expected)
PY
echo "cleaned"
echo "OK: phase3177 e2e passed"
