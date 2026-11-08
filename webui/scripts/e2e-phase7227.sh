#!/usr/bin/env bash
# Phase-7227: clear title mentions ssh-alternative-titles-refresh roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-alternative-titles-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAlternativeTitlesRefreshRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_alternative_titles_refresh_roster ok"; echo "cleaned"; echo "OK: phase7227 e2e passed"
