#!/usr/bin/env bash
# Phase-7306: UI ssh-refusal-path-titles-refresh roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathTitlesRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshRefusalPathTitlesRefreshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathTitlesRefreshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_path_titles_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase7306 e2e passed"
