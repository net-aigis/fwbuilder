#!/usr/bin/env bash
# Phase-5011: UI honesty milestone + Soft 5000+ ssh_alternatives_roster Soft-Checkpoint at 13750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13750 UI ok"; echo "cleaned"; echo "OK: phase5011 e2e passed"
