#!/usr/bin/env bash
# Phase-2153: operator_brief in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "operator_brief" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "operator_brief" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "operator_brief" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "operator_brief" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 14
assert h.get("soft_fertig_honesty_bundle_section_count") >= 15
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2160
print("operator_brief export/bundle ok")
PY
echo "cleaned"
echo "OK: phase2153 e2e passed"
