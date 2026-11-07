#!/usr/bin/env bash
# Phase-6173: ssh_alternative_presence_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_alternative_presence_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "ssh_alternative_presence_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "ssh_alternative_presence_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "ssh_alternative_presence_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get('soft_fertig_honesty_export_key_count') >= 63
assert h.get('soft_fertig_honesty_bundle_section_count') >= 64
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6160
print("ssh_alternative_presence_roster export/bundle ok")
PY
echo "cleaned"; echo "OK: phase6173 e2e passed"
