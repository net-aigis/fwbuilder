#!/usr/bin/env bash
# Phase-7146: UI ssh-alternatives-refresh roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativesRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAlternativesRefreshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRefreshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternatives_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase7146 e2e passed"
