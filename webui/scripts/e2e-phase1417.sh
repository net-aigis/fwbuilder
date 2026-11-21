#!/usr/bin/env bash
# Phase-1417: UI download/copy related refusals buttons.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Download related refusals' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Copy related refusals' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb-related-refusals-' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert len(h.get("hard_gap_related_refusals") or {}) == 3
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1424
print("related refusals download data ok")
PY
echo "cleaned"
echo "OK: phase1417 e2e passed"
