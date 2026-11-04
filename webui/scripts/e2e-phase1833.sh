#!/usr/bin/env bash
# Phase-1833: track_note in catalog_summary + export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "track_note" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "track_note" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
s = m.soft_fertig_catalog_summary()
assert "three hard gaps" in str(s.get("soft_fertig_honesty_track_note") or "")
h = m.hard_gaps()
assert "track_note" in (h.get("soft_fertig_honesty_export_keys") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 10
assert h.get("soft_fertig_honesty_bundle_section_count") >= 11
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1840
print("track_note catalogs ok")
PY
echo "cleaned"
echo "OK: phase1833 e2e passed"
