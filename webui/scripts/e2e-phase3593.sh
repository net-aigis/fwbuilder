#!/usr/bin/env bash
# Phase-3593: surface_changelog_meta_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "surface_changelog_meta_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "surface_changelog_meta_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 32
assert h.get("soft_fertig_honesty_bundle_section_count") >= 33
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3600
print("surface_changelog_meta_roster export/bundle ok")
PY
echo "cleaned"
echo "OK: phase3593 e2e passed"
