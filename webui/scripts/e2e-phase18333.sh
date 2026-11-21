#!/usr/bin/env bash
# Phase-18333: ssh_auth_ms_50500_echo_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_auth_ms_50500_echo_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "ssh_auth_ms_50500_echo_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "ssh_auth_ms_50500_echo_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "ssh_auth_ms_50500_echo_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get('soft_fertig_honesty_export_key_count') >= 216
assert h.get('soft_fertig_honesty_bundle_section_count') >= 217
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18344
print("ssh_auth_ms_50500_echo_roster export/bundle ok")
PY
echo "cleaned"; echo "OK: phase18333 e2e passed"
