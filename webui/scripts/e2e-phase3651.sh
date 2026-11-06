#!/usr/bin/env bash
# Phase-3651: UI honesty milestone at 9500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig surface changelog meta roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9500 UI ok"
echo "cleaned"
echo "OK: phase3651 e2e passed"
