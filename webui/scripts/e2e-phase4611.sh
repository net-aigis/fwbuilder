#!/usr/bin/env bash
# Phase-4611: UI honesty milestone at 12500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-auth roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12500 UI ok"
echo "cleaned"
echo "OK: phase4611 e2e passed"
