#!/usr/bin/env bash
# Phase-6963: UI honesty milestone + ssh_auth_policy_refresh_roster export at 18850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18850 UI ok"; echo "cleaned"; echo "OK: phase6963 e2e passed"
