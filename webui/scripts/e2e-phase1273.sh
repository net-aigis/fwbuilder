#!/usr/bin/env bash
# Phase-1273: UI soft-fertig surface expandable detail.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig surface keys' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_surface_keys' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert int(h.get("soft_fertig_surface_key_count") or 0) >= 23
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1280
print("surface detail data ok", h.get("soft_fertig_surface_key_count"))
PY
echo "cleaned"
echo "OK: phase1273 e2e passed"
