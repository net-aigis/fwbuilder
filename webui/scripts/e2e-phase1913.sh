#!/usr/bin/env bash
# Phase-1913: readiness in catalog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "readiness" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "readiness" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "readiness" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "readiness" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") >= 11
assert h.get("soft_fertig_honesty_bundle_section_count") >= 12
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1920
print("readiness export/bundle ok")
PY
echo "cleaned"
echo "OK: phase1913 e2e passed"
