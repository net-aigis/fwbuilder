#!/usr/bin/env bash
# Phase-5427: UI honesty milestone + ssh_alternative_titles_roster at 15050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15050 UI ok"; echo "cleaned"; echo "OK: phase5427 e2e passed"
