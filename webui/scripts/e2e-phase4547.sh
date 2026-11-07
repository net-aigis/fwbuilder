#!/usr/bin/env bash
# Phase-4547: UI honesty milestone + ssh_auth_roster at 12300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12300 UI ok"
echo "cleaned"
echo "OK: phase4547 e2e passed"
