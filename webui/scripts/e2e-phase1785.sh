#!/usr/bin/env bash
# Phase-1785: catalog_summary in export + bundle catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "catalog_summary" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "catalog_summary" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "catalog_summary" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "catalog_summary" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 9
assert h.get("soft_fertig_honesty_bundle_section_count") >= 10
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1792
print("catalog_summary in export+bundle ok")
PY
echo "cleaned"
echo "OK: phase1785 e2e passed"
