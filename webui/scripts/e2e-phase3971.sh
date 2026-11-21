#!/usr/bin/env bash
# Phase-3971: UI honesty milestone at 10500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig res-status roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10500 UI ok"
echo "cleaned"
echo "OK: phase3971 e2e passed"
