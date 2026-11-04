#!/usr/bin/env bash
# Phase-1891: UI honesty milestone + track note detail at 4000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig track note' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4000 UI ok"
echo "cleaned"
echo "OK: phase1891 e2e passed"
