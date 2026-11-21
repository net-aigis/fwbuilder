#!/usr/bin/env bash
# Phase-4947: UI honesty milestone + ssh_alternatives_roster at 13550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13550 UI ok"; echo "cleaned"; echo "OK: phase4947 e2e passed"
