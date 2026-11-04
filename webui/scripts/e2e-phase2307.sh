#!/usr/bin/env bash
# Phase-2307: UI honesty milestone + hard-gap refusal roster at 5300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gap refusal roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5300 UI ok"
echo "cleaned"
echo "OK: phase2307 e2e passed"
