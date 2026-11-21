#!/usr/bin/env bash
# Phase-1337: soft_fertig_surface catalog mirrored on summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
s = m.hard_gaps_summary()
for k in (
    "soft_fertig_surface_keys",
    "soft_fertig_surface_key_titles",
    "soft_fertig_surface_notes",
    "soft_fertig_surface_key_count",
    "soft_fertig_surface_notes_count",
):
    assert s.get(k) == h.get(k), k
assert len(s.get("soft_fertig_surface_keys") or []) >= 23
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1344
print("summary soft_fertig_surface mirror ok")
PY
echo "cleaned"
echo "OK: phase1337 e2e passed"
