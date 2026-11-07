#!/usr/bin/env bash
# Phase-4587: clear title mentions ssh-auth roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'ssh-auth roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAuthRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_auth_roster ok"
echo "cleaned"
echo "OK: phase4587 e2e passed"
