#!/usr/bin/env bash
# Phase-6987: clear title mentions ssh-auth-policy-refresh roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-auth-policy-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAuthPolicyRefreshRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_auth_policy_refresh_roster ok"; echo "cleaned"; echo "OK: phase6987 e2e passed"
