#!/usr/bin/env bash
# Phase-1289: UI related refusals expandable detail.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'relatedRefusalsDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Related hard-gap refusals' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert len(h.get("hard_gap_related_refusals") or {}) == 3
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1296
print("related refusals detail data ok")
PY
echo "cleaned"
echo "OK: phase1289 e2e passed"
