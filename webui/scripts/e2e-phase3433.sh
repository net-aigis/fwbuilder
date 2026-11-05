#!/usr/bin/env bash
# Phase-3433: session_storage_clear_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "session_storage_clear_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "session_storage_clear_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "session_storage_clear_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "session_storage_clear_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 30
assert h.get("soft_fertig_honesty_bundle_section_count") >= 31
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3440
print("session_storage_clear_roster export/bundle ok")
PY
echo "cleaned"
echo "OK: phase3433 e2e passed"
