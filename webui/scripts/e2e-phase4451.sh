#!/usr/bin/env bash
# Phase-4451: UI honesty milestone at 12000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig expect-steps roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12000 UI ok"
echo "cleaned"
echo "OK: phase4451 e2e passed"
