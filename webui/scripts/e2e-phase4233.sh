#!/usr/bin/env bash
# Phase-4233: option_enable_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "option_enable_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "option_enable_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "option_enable_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "option_enable_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 40
assert h.get("soft_fertig_honesty_bundle_section_count") >= 41
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4240
print("option_enable_roster export/bundle ok")
PY
echo "cleaned"
echo "OK: phase4233 e2e passed"
