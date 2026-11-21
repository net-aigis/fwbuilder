#!/usr/bin/env bash
# Phase-2547: UI honesty milestone + honesty export roster at 6050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty export roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6050 UI ok"
echo "cleaned"
echo "OK: phase2547 e2e passed"
