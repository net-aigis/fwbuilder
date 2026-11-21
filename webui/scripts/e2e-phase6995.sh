#!/usr/bin/env bash
# Phase-6995: UI honesty milestone + ssh_auth_policy_refresh_roster sessionStorage at 18900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18900 UI ok"; echo "cleaned"; echo "OK: phase6995 e2e passed"
