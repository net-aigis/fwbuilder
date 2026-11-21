#!/usr/bin/env bash
# Phase-4153: stack_switch_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "stack_switch_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "stack_switch_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "stack_switch_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "stack_switch_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 39
assert h.get("soft_fertig_honesty_bundle_section_count") >= 40
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4160
print("stack_switch_roster export/bundle ok")
PY
echo "cleaned"
echo "OK: phase4153 e2e passed"
