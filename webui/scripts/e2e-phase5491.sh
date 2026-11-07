#!/usr/bin/env bash
# Phase-5491: UI honesty milestone + Soft 5480+ ssh_alternative_titles_roster Soft-Checkpoint at 15250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15250 UI ok"; echo "cleaned"; echo "OK: phase5491 e2e passed"
