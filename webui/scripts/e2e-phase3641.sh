#!/usr/bin/env bash
# Phase-3641: Soft 3640+ honesty surface still complete (surface_changelog_meta_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SURFACE_CHANGELOG_META_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3640
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_surface_changelog_meta_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3648
print("Soft 3640+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3641 e2e passed"
