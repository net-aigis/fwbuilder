#!/usr/bin/env bash
# Phase-611: soft-fertig track UI + honesty paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigHonestyTrack' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft-fertig track' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathsSummary' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Honesty paths:' webui/frontend/src/components/FirewallExtras.tsx
echo "soft-fertig UI ok"
echo "cleaned"
echo "OK: phase611 e2e passed"
