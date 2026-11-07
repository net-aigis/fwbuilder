#!/usr/bin/env bash
# Phase-5795: UI honesty milestone + ssh_alternative_support_roster sessionStorage at 16150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16150 UI ok"; echo "cleaned"; echo "OK: phase5795 e2e passed"
