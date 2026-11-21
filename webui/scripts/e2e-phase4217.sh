#!/usr/bin/env bash
# Phase-4217: soft_fertig_option_enable_roster on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_OPTION_ENABLE_KEYS)
assert expected == 10
r = m.soft_fertig_option_enable_roster()
assert r.get("entry_count") == expected
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == expected
assert all("id" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_option_enable_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_option_enable_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_option_enable_roster") or {}).get("hard_gaps_remain") is True
cs = m.soft_fertig_catalog_summary()
assert cs.get("soft_fertig_option_enable_roster_entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4224
print("option_enable_roster ok", expected)
PY
echo "cleaned"
echo "OK: phase4217 e2e passed"
