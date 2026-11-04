#!/usr/bin/env bash
# Phase-1753: soft_fertig_catalog_summary on health + hard-gaps (+ summary/closure).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
s = m.soft_fertig_catalog_summary()
assert s["soft_fertig_honesty_surface_version"] == "1.0"
assert int(s["soft_fertig_surface_key_count"]) >= 44
assert int(s["soft_fertig_session_storage_key_count"]) == 6
assert int(s["soft_fertig_honesty_export_key_count"]) == 8
assert int(s["soft_fertig_honesty_bundle_section_count"]) == 9
assert int(s["hard_gap_count"]) == 3
h = m.hard_gaps()
health = m.health()
assert health.get("soft_fertig_catalog_summary") == s
assert h.get("soft_fertig_catalog_summary") == s
assert m.hard_gaps_summary().get("soft_fertig_catalog_summary") == s
assert m.hard_gap_closure().get("soft_fertig_catalog_summary") == s
assert "soft_fertig_catalog_summary" in m.SOFT_FERTIG_SURFACE_KEYS
assert "soft_fertig_catalog_summary" in (h.get("soft_fertig_surface_keys") or [])
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1760
print("catalog summary", s)
PY
echo "cleaned"
echo "OK: phase1753 e2e passed"
