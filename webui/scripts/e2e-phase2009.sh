#!/usr/bin/env bash
# Phase-2009: soft_complete_note in export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "soft_complete_note" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "soft_complete_note" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "soft_complete_note" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "soft_complete_note" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 12
assert h.get("soft_fertig_honesty_bundle_section_count") >= 13
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2016
print("soft_complete_note export/bundle ok")
PY
echo "cleaned"
echo "OK: phase2009 e2e passed"
