#!/usr/bin/env bash
# Phase-1233: soft_fertig_surface_keys on hard-gaps (+ count on summary).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.SOFT_FERTIG_SURFACE_KEYS) >= 20
h = m.hard_gaps()
s = m.hard_gaps_summary()
keys = h.get("soft_fertig_surface_keys") or []
assert list(keys) == list(m.SOFT_FERTIG_SURFACE_KEYS)
assert h.get("soft_fertig_surface_key_count") == len(keys)
assert s.get("soft_fertig_surface_key_count") == len(keys)
titles = h.get("soft_fertig_surface_key_titles") or {}
assert set(titles) == set(keys)
for k in keys:
    assert k in h, f"surface key missing from hard-gaps payload: {k}"
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1240
print("soft_fertig_surface_keys", len(keys))
PY
echo "cleaned"
echo "OK: phase1233 e2e passed"
