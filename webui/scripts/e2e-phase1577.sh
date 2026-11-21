#!/usr/bin/env bash
# Phase-1577: soft_fertig_honesty_export_keys on hard-gaps (+ summary/closure).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.SOFT_FERTIG_HONESTY_EXPORT_KEYS) >= 5
h = m.hard_gaps()
s = m.hard_gaps_summary()
c = m.hard_gap_closure()
keys = h.get("soft_fertig_honesty_export_keys") or []
assert keys == list(m.SOFT_FERTIG_HONESTY_EXPORT_KEYS)
assert h.get("soft_fertig_honesty_export_key_count") == len(keys)
assert set(h.get("soft_fertig_honesty_export_key_titles") or {}) == set(keys)
assert h.get("soft_fertig_honesty_export_notes_count") == len(keys)
assert s.get("soft_fertig_honesty_export_key_count") == len(keys)
assert c.get("soft_fertig_honesty_export_keys") == keys
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1584
print("honesty export keys", keys)
PY
echo "cleaned"
echo "OK: phase1577 e2e passed"
