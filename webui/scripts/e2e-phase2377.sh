#!/usr/bin/env bash
# Phase-2377: soft_fertig_honesty_path_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
r = m.soft_fertig_honesty_path_roster()
assert r.get("entry_count") == len(m.HONESTY_PATHS)
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == len(m.HONESTY_PATHS)
assert all("path" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_honesty_path_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_path_roster") or {}).get("entry_count") == len(
    m.HONESTY_PATHS
)
assert (m.health().get("soft_fertig_honesty_path_roster") or {}).get(
    "hard_gaps_remain"
) is True
assert "soft_fertig_honesty_path_roster_entry_count" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2384
print("honesty_path_roster ok")
PY
echo "cleaned"
echo "OK: phase2377 e2e passed"
