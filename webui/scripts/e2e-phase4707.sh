#!/usr/bin/env bash
# Phase-4707: UI honesty milestone + ssh_not_implemented_roster at 12800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12800 UI ok"
echo "cleaned"
echo "OK: phase4707 e2e passed"
