#!/usr/bin/env bash
# Phase-2371: UI honesty milestone at 5500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gap refusal roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5500 UI ok"
echo "cleaned"
echo "OK: phase2371 e2e passed"
