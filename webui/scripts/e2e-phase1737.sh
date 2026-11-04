#!/usr/bin/env bash
# Phase-1737: surface_version in export + bundle catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "surface_version" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "surface_version" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "surface_version" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "surface_version" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") == 8
assert h.get("soft_fertig_honesty_bundle_section_count") == 9
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1744
print("surface_version in export+bundle ok")
PY
echo "cleaned"
echo "OK: phase1737 e2e passed"
