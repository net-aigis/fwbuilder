#!/usr/bin/env bash
# Phase-1481: session storage keys on summary + closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
s = m.hard_gaps_summary()
c = m.hard_gap_closure()
keys = h.get("soft_fertig_session_storage_keys") or {}
titles = h.get("soft_fertig_session_storage_key_titles") or {}
assert s.get("soft_fertig_session_storage_keys") == keys
assert s.get("soft_fertig_session_storage_key_titles") == titles
assert c.get("soft_fertig_session_storage_keys") == keys
assert c.get("soft_fertig_session_storage_key_titles") == titles
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1488
print("session storage keys on summary+closure ok")
PY
echo "cleaned"
echo "OK: phase1481 e2e passed"
