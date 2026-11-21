#!/usr/bin/env bash
# Phase-1265: soft_fertig_surface_keys includes related refusals.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "hard_gap_related_refusals" in m.SOFT_FERTIG_SURFACE_KEYS
assert "hard_gap_related_refusal_titles" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
keys = h.get("soft_fertig_surface_keys") or []
assert "hard_gap_related_refusals" in keys
assert "hard_gap_related_refusal_titles" in keys
assert h.get("soft_fertig_surface_key_count") == len(keys)
assert len(keys) >= 23
for k in keys:
    assert k in h, f"missing {k}"
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1272
print("surface keys", len(keys))
PY
echo "cleaned"
echo "OK: phase1265 e2e passed"
