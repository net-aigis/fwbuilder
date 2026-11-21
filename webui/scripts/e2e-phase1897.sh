#!/usr/bin/env bash
# Phase-1897: soft_fertig_honesty_readiness on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
r = m.soft_fertig_honesty_readiness()
assert r.get("soft_fertig_catalogs_complete") is True
assert r.get("hard_gaps_remain") is True
assert r.get("hard_gap_count") == 3
assert "soft_fertig_honesty_readiness" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_readiness") or {}).get("hard_gap_count") == 3
assert (m.health().get("soft_fertig_honesty_readiness") or {}).get("hard_gaps_remain") is True
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1904
print("honesty readiness ok")
PY
echo "cleaned"
echo "OK: phase1897 e2e passed"
