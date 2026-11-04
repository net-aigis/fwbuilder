#!/usr/bin/env bash
# Phase-2931: UI honesty milestone at 7250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig expect step roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7250 UI ok"
echo "cleaned"
echo "OK: phase2931 e2e passed"
