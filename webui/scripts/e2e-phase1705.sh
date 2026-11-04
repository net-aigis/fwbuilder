#!/usr/bin/env bash
# Phase-1705: session_storage_clear in export + bundle catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "session_storage_clear" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "session_storage_clear" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
h = m.hard_gaps()
assert "session_storage_clear" in (h.get("soft_fertig_honesty_export_keys") or [])
assert "session_storage_clear" in (h.get("soft_fertig_honesty_bundle_sections") or [])
assert h.get("soft_fertig_honesty_export_key_count") == 7
assert h.get("soft_fertig_honesty_bundle_section_count") == 8
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1712
print("session_storage_clear in export+bundle ok")
PY
echo "cleaned"
echo "OK: phase1705 e2e passed"
