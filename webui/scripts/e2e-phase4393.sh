#!/usr/bin/env bash
# Phase-4393: expect_steps_roster in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "expect_steps_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "expect_steps_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "expect_steps_roster" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "expect_steps_roster" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 42
assert h.get("soft_fertig_honesty_bundle_section_count") >= 43
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4400
print("expect_steps_roster export/bundle ok")
PY
echo "cleaned"
echo "OK: phase4393 e2e passed"
