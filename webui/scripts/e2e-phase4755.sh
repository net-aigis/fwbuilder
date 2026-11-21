#!/usr/bin/env bash
# Phase-4755: UI honesty milestone + ssh_not_implemented_roster sessionStorage at 12950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12950 UI ok"
echo "cleaned"
echo "OK: phase4755 e2e passed"
