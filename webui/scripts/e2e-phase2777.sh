#!/usr/bin/env bash
# Phase-2777: soft_fertig_changelog_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
r = m.soft_fertig_changelog_roster()
assert r.get("entry_count") == len(m.SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG)
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == len(m.SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG)
assert all("id" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_changelog_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_changelog_roster") or {}).get("entry_count") == len(
    m.SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG
)
assert (m.health().get("soft_fertig_changelog_roster") or {}).get(
    "hard_gaps_remain"
) is True
assert "soft_fertig_changelog_roster_entry_count" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2784
print("changelog_roster ok")
PY
echo "cleaned"
echo "OK: phase2777 e2e passed"
