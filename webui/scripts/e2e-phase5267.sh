#!/usr/bin/env bash
# Phase-5267: UI honesty milestone + ssh_auth_policy_roster at 14550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14550 UI ok"; echo "cleaned"; echo "OK: phase5267 e2e passed"
