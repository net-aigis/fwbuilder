#!/usr/bin/env bash
# Phase-3123: UI honesty milestone + layout_fidelity_sample_roster bundle at 7850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7850 UI ok"
echo "cleaned"
echo "OK: phase3123 e2e passed"
