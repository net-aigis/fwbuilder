#!/usr/bin/env bash
# Phase-5513: ssh_refusal_path_titles_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_refusal_path_titles_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "ssh_refusal_path_titles_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "ssh_refusal_path_titles_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "ssh_refusal_path_titles_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 51
assert h.get("soft_fertig_honesty_bundle_section_count") >= 52
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5520
print("ssh_refusal_path_titles_roster export/bundle ok")
PY
echo "cleaned"; echo "OK: phase5513 e2e passed"
