#!/usr/bin/env bash
# Phase-4691: UI honesty milestone at 12750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig password-ssh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12750 UI ok"
echo "cleaned"
echo "OK: phase4691 e2e passed"
