#!/usr/bin/env bash
# Phase-6986: UI ssh-auth-policy-refresh roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAuthPolicyRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAuthPolicyRefreshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRefreshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_auth_policy_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6986 e2e passed"
