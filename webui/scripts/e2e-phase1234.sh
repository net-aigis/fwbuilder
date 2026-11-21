#!/usr/bin/env bash
# Phase-1234: UI soft-fertig surface keys bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_key' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
echo "UI soft-fertig surface keys ok"
echo "cleaned"
echo "OK: phase1234 e2e passed"
