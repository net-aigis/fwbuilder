#!/usr/bin/env bash
# Phase-1465: soft_fertig_session_storage_keys on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.SOFT_FERTIG_SESSION_STORAGE_KEYS) >= 5
h = m.hard_gaps()
s = m.hard_gaps_summary()
keys = h.get("soft_fertig_session_storage_keys") or {}
assert keys == m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert h.get("soft_fertig_session_storage_key_count") == len(keys)
assert s.get("soft_fertig_session_storage_key_count") == len(keys)
assert "softFertigSurface" in keys["soft_fertig_surface"]
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1472
print("session storage keys", keys)
PY
echo "cleaned"
echo "OK: phase1465 e2e passed"
