#!/usr/bin/env bash
# Phase-2297: soft_fertig_hard_gap_refusal_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
r = m.soft_fertig_hard_gap_refusal_roster()
assert r.get("hard_gap_count") == 3
assert r.get("entry_count") == 3
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == 3
assert all("refusal_keys" in e for e in (r.get("entries") or []))
assert "soft_fertig_hard_gap_refusal_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_hard_gap_refusal_roster") or {}).get("entry_count") == 3
assert (m.health().get("soft_fertig_hard_gap_refusal_roster") or {}).get(
    "hard_gaps_remain"
) is True
assert "soft_fertig_hard_gap_refusal_roster_entry_count" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2304
print("hard_gap_refusal_roster ok")
PY
echo "cleaned"
echo "OK: phase2297 e2e passed"
