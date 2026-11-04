#!/usr/bin/env bash
# Phase-2873: expect_step_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "expect_step_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "expect_step_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "expect_step_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "expect_step_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 23
assert h.get("soft_fertig_honesty_bundle_section_count") >= 24
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2880
print("expect_step_roster export/bundle ok")
PY
echo "cleaned"
echo "OK: phase2873 e2e passed"
