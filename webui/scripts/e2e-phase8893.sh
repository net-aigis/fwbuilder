#!/usr/bin/env bash
# Phase-8893: ssh_password_support_refresh_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_password_support_refresh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "ssh_password_support_refresh_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "ssh_password_support_refresh_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "ssh_password_support_refresh_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get('soft_fertig_honesty_export_key_count') >= 98
assert h.get('soft_fertig_honesty_bundle_section_count') >= 99
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8904
print("ssh_password_support_refresh_roster export/bundle ok")
PY
echo "cleaned"; echo "OK: phase8893 e2e passed"
