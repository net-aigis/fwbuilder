#!/usr/bin/env bash
# Phase-3033: layout_fidelity_signal_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "layout_fidelity_signal_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "layout_fidelity_signal_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "layout_fidelity_signal_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "layout_fidelity_signal_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 25
assert h.get("soft_fertig_honesty_bundle_section_count") >= 26
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3040
print("layout_fidelity_signal_roster export/bundle ok")
PY
echo "cleaned"
echo "OK: phase3033 e2e passed"
