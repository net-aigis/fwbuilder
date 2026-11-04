#!/usr/bin/env bash
# Phase-2089: surface_changelog in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "surface_changelog" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "surface_changelog" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "surface_changelog" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "surface_changelog" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 13
assert h.get("soft_fertig_honesty_bundle_section_count") >= 14
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2096
print("surface_changelog export/bundle ok")
PY
echo "cleaned"
echo "OK: phase2089 e2e passed"
