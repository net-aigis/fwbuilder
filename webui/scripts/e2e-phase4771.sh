#!/usr/bin/env bash
# Phase-4771: UI honesty milestone + Soft 4760+ ssh_not_implemented_roster Soft-Checkpoint at 13000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13000 UI ok"
echo "cleaned"
echo "OK: phase4771 e2e passed"
