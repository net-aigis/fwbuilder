#!/usr/bin/env bash
# Phase-1561: soft_fertig_surface_keys includes session storage notes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "soft_fertig_session_storage_notes" in m.SOFT_FERTIG_SURFACE_KEYS
assert "soft_fertig_session_storage_notes_count" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
keys = h.get("soft_fertig_surface_keys") or []
assert "soft_fertig_session_storage_notes" in keys
assert "soft_fertig_session_storage_notes_count" in keys
assert h.get("soft_fertig_surface_key_count") == len(keys)
assert len(keys) >= 28
for k in keys:
    assert k in h, f"missing {k}"
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1568
print("surface keys", len(keys))
PY
echo "cleaned"
echo "OK: phase1561 e2e passed"
