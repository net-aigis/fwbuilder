#!/usr/bin/env bash
# Phase-1657: soft_fertig_session_storage_clear_* on hard-gaps (+ summary/closure).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert list(m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS) == list(
    m.SOFT_FERTIG_SESSION_STORAGE_KEYS.keys()
)
assert "Clear honesty catalogs" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_NOTE
h = m.hard_gaps()
s = m.hard_gaps_summary()
c = m.hard_gap_closure()
keys = h.get("soft_fertig_session_storage_clear_keys") or []
assert keys == list(m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS)
assert h.get("soft_fertig_session_storage_clear_key_count") == len(keys)
assert "Clear honesty catalogs" in (h.get("soft_fertig_session_storage_clear_note") or "")
assert s.get("soft_fertig_session_storage_clear_key_count") == len(keys)
assert c.get("soft_fertig_session_storage_clear_keys") == keys
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1664
print("session storage clear", keys)
PY
echo "cleaned"
echo "OK: phase1657 e2e passed"
