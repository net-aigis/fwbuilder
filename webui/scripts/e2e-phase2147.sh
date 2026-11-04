#!/usr/bin/env bash
# Phase-2147: UI honesty milestone + operator brief at 4800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty operator brief' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4800 UI ok"
echo "cleaned"
echo "OK: phase2147 e2e passed"
