#!/usr/bin/env bash
# Phase-1353: soft_fertig_surface catalog on closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
c = m.hard_gap_closure()
for k in (
    "soft_fertig_surface_keys",
    "soft_fertig_surface_key_titles",
    "soft_fertig_surface_notes",
    "soft_fertig_surface_key_count",
    "soft_fertig_surface_notes_count",
):
    assert c.get(k) == h.get(k), k
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1360
print("closure soft_fertig_surface ok")
PY
echo "cleaned"
echo "OK: phase1353 e2e passed"
