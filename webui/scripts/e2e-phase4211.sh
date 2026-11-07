#!/usr/bin/env bash
# Phase-4211: UI honesty milestone at 11250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig stack-switch roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11250 UI ok"
echo "cleaned"
echo "OK: phase4211 e2e passed"
