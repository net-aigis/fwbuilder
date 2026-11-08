#!/usr/bin/env bash
# Phase-14093: ssh_auth_gap_refusal_title_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_auth_gap_refusal_title_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "ssh_auth_gap_refusal_title_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "ssh_auth_gap_refusal_title_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "ssh_auth_gap_refusal_title_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get('soft_fertig_honesty_export_key_count') >= 163
assert h.get('soft_fertig_honesty_bundle_section_count') >= 164
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14104
print("ssh_auth_gap_refusal_title_roster export/bundle ok")
PY
echo "cleaned"; echo "OK: phase14093 e2e passed"
