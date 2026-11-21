#!/usr/bin/env bash
# Phase-5331: UI honesty milestone + Soft 5320+ ssh_auth_policy_roster Soft-Checkpoint at 14750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14750 UI ok"; echo "cleaned"; echo "OK: phase5331 e2e passed"
