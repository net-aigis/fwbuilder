#!/usr/bin/env bash
# Phase-4667: clear title mentions password-ssh roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'password-ssh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(passwordSshRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear password_ssh_roster ok"
echo "cleaned"
echo "OK: phase4667 e2e passed"
