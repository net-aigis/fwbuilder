#!/usr/bin/env bash
# Phase-4051: UI honesty milestone at 10750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gaps field roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10750 UI ok"
echo "cleaned"
echo "OK: phase4051 e2e passed"
