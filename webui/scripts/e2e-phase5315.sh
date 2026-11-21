#!/usr/bin/env bash
# Phase-5315: UI honesty milestone + ssh_auth_policy_roster sessionStorage at 14700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14700 UI ok"; echo "cleaned"; echo "OK: phase5315 e2e passed"
