#!/usr/bin/env bash
# Phase-2457: soft_fertig_session_storage_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
r = m.soft_fertig_session_storage_roster()
assert r.get("entry_count") == len(m.SOFT_FERTIG_SESSION_STORAGE_KEYS)
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == len(m.SOFT_FERTIG_SESSION_STORAGE_KEYS)
assert all("prefix" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_session_storage_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_session_storage_roster") or {}).get("entry_count") == len(
    m.SOFT_FERTIG_SESSION_STORAGE_KEYS
)
assert (m.health().get("soft_fertig_session_storage_roster") or {}).get(
    "hard_gaps_remain"
) is True
assert "soft_fertig_session_storage_roster_entry_count" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2464
print("session_storage_roster ok")
PY
echo "cleaned"
echo "OK: phase2457 e2e passed"
