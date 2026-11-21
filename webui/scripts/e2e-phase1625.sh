#!/usr/bin/env bash
# Phase-1625: soft_fertig_surface_keys includes honesty bundle fields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
for k in (
    "soft_fertig_honesty_bundle_sections",
    "soft_fertig_honesty_bundle_section_count",
    "soft_fertig_honesty_bundle_section_titles",
    "soft_fertig_honesty_bundle_notes",
    "soft_fertig_honesty_bundle_notes_count",
):
    assert k in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
keys = h.get("soft_fertig_surface_keys") or []
assert "soft_fertig_honesty_bundle_sections" in keys
assert h.get("soft_fertig_surface_key_count") == len(keys)
assert len(keys) >= 38
for k in keys:
    assert k in h, f"missing {k}"
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1632
print("surface keys", len(keys))
PY
echo "cleaned"
echo "OK: phase1625 e2e passed"
