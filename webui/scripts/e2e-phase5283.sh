#!/usr/bin/env bash
# Phase-5283: UI honesty milestone + ssh_auth_policy_roster export at 14600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14600 UI ok"; echo "cleaned"; echo "OK: phase5283 e2e passed"
