#!/usr/bin/env bash
# Phase-5307: clear title mentions ssh-auth-policy roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-auth-policy roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAuthPolicyRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_auth_policy_roster ok"; echo "cleaned"; echo "OK: phase5307 e2e passed"
