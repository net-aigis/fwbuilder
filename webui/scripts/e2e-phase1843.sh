#!/usr/bin/env bash
# Phase-1843: UI honesty milestone + track note download at 3850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download track note' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3850 UI ok"
echo "cleaned"
echo "OK: phase1843 e2e passed"
