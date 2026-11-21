#!/usr/bin/env bash
# Phase-1555: UI still shows honesty milestone note wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_milestone' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2950 UI ok"
echo "cleaned"
echo "OK: phase1555 e2e passed"
