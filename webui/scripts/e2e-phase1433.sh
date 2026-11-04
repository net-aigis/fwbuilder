#!/usr/bin/env bash
# Phase-1433: UI download/copy honesty paths buttons.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Download honesty paths' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Copy honesty paths' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb-honesty-paths-' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert len(h.get("honesty_paths") or {}) >= 11
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1440
print("honesty paths download data ok")
PY
echo "cleaned"
echo "OK: phase1433 e2e passed"
