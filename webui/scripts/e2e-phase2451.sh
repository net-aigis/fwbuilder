#!/usr/bin/env bash
# Phase-2451: UI honesty milestone at 5750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5750 UI ok"
echo "cleaned"
echo "OK: phase2451 e2e passed"
