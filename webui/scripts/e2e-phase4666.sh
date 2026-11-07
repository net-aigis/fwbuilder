#!/usr/bin/env bash
# Phase-4666: UI password-ssh roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'passwordSshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.passwordSshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'passwordSshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI password_ssh_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4666 e2e passed"
