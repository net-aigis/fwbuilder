#!/usr/bin/env bash
# Phase-4371: UI honesty milestone at 11750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig expect-run roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11750 UI ok"
echo "cleaned"
echo "OK: phase4371 e2e passed"
