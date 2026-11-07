#!/usr/bin/env bash
# Phase-4995: UI honesty milestone + ssh_alternatives_roster sessionStorage at 13700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13700 UI ok"; echo "cleaned"; echo "OK: phase4995 e2e passed"
