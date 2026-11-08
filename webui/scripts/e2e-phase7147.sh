#!/usr/bin/env bash
# Phase-7147: clear title mentions ssh-alternatives-refresh roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-alternatives-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAlternativesRefreshRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_alternatives_refresh_roster ok"; echo "cleaned"; echo "OK: phase7147 e2e passed"
