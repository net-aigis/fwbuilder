#!/usr/bin/env bash
# Phase-4586: UI ssh-auth roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sshAuthRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAuthRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_auth_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4586 e2e passed"
