#!/usr/bin/env bash
# Phase-1641: honesty_bundle in sessionStorage + export catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honesty_bundle" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["honesty_bundle"].startswith("fwbweb.honestyBundle.")
assert "honesty_bundle" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "honesty_bundle" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "honesty_bundle" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "honesty_bundle" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "honesty_bundle" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
h = m.hard_gaps()
assert "honesty_bundle" in (h.get("soft_fertig_session_storage_keys") or {})
assert "honesty_bundle" in (h.get("soft_fertig_honesty_export_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") == 6
assert h.get("soft_fertig_honesty_export_key_count") == 6
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1648
print("honesty_bundle catalogs ok")
PY
echo "cleaned"
echo "OK: phase1641 e2e passed"
