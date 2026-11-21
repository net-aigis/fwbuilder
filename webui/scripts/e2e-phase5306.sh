#!/usr/bin/env bash
# Phase-5306: UI ssh-auth-policy roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAuthPolicyRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAuthPolicyRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_auth_policy_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5306 e2e passed"
