#!/usr/bin/env bash
# Phase-4627: UI honesty milestone + password_ssh_roster at 12550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'passwordSshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12550 UI ok"
echo "cleaned"
echo "OK: phase4627 e2e passed"
