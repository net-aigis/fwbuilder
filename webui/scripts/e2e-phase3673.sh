#!/usr/bin/env bash
# Phase-3673: hard_gaps_summary_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "hard_gaps_summary_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "hard_gaps_summary_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "hard_gaps_summary_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "hard_gaps_summary_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 33
assert h.get("soft_fertig_honesty_bundle_section_count") >= 34
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3680
print("hard_gaps_summary_roster export/bundle ok")
PY
echo "cleaned"
echo "OK: phase3673 e2e passed"
