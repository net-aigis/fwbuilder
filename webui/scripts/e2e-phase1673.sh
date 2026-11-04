#!/usr/bin/env bash
# Phase-1673: soft_fertig_surface_keys includes session storage clear fields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
for k in (
    "soft_fertig_session_storage_clear_keys",
    "soft_fertig_session_storage_clear_key_count",
    "soft_fertig_session_storage_clear_note",
):
    assert k in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
keys = h.get("soft_fertig_surface_keys") or []
assert "soft_fertig_session_storage_clear_keys" in keys
assert h.get("soft_fertig_surface_key_count") == len(keys)
assert len(keys) >= 41
for k in keys:
    assert k in h, f"missing {k}"
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1680
print("surface keys", len(keys))
PY
echo "cleaned"
echo "OK: phase1673 e2e passed"
