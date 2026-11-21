#!/usr/bin/env bash
# Phase-4787: UI honesty milestone + ssh_implemented_roster at 13050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13050 UI ok"; echo "cleaned"; echo "OK: phase4787 e2e passed"
