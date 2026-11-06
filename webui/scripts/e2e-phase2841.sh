#!/usr/bin/env bash
# Phase-2841: Soft 2840+ honesty surface still complete (changelog_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2840
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "changelog_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "changelog_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_changelog_roster") or {}).get("entry_count") == len(m.SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2848
print("Soft 2840+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2841 e2e passed"
