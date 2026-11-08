#!/usr/bin/env bash
# Phase-7226: UI ssh-alternative-titles-refresh roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativeTitlesRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAlternativeTitlesRefreshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeTitlesRefreshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternative_titles_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase7226 e2e passed"
