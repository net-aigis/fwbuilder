#!/usr/bin/env bash
# Phase-7693: ssh_method_lists_refresh_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_method_lists_refresh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "ssh_method_lists_refresh_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "ssh_method_lists_refresh_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "ssh_method_lists_refresh_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get('soft_fertig_honesty_export_key_count') >= 83
assert h.get('soft_fertig_honesty_bundle_section_count') >= 84
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7680
print("ssh_method_lists_refresh_roster export/bundle ok")
PY
echo "cleaned"; echo "OK: phase7693 e2e passed"
