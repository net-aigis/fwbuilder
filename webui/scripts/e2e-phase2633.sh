#!/usr/bin/env bash
# Phase-2633: honesty_bundle_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honesty_bundle_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "honesty_bundle_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "honesty_bundle_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "honesty_bundle_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 20
assert h.get("soft_fertig_honesty_bundle_section_count") >= 21
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2640
print("honesty_bundle_roster export/bundle ok")
PY
echo "cleaned"
echo "OK: phase2633 e2e passed"
