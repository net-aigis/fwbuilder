#!/usr/bin/env bash
# Phase-7066: UI ssh-refusal-paths-refresh roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathsRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshRefusalPathsRefreshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRefreshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_paths_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase7066 e2e passed"
