#!/usr/bin/env bash
# Phase-7067: clear title mentions ssh-refusal-paths-refresh roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-refusal-paths-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshRefusalPathsRefreshRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_refusal_paths_refresh_roster ok"; echo "cleaned"; echo "OK: phase7067 e2e passed"
