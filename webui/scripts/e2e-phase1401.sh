#!/usr/bin/env bash
# Phase-1401: UI download/copy soft-fertig surface buttons.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Download soft-fertig surface' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Copy soft-fertig surface' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb-soft-fertig-surface-' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert "soft_fertig_surface_keys" in h
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1408
print("surface download data ok")
PY
echo "cleaned"
echo "OK: phase1401 e2e passed"
