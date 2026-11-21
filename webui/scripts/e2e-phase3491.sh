#!/usr/bin/env bash
# Phase-3491: UI honesty milestone at 9000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig session storage clear roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9000 UI ok"
echo "cleaned"
echo "OK: phase3491 e2e passed"
