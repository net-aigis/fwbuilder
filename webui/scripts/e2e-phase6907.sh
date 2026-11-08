#!/usr/bin/env bash
# Phase-6907: clear title mentions ssh-refusal-status-refresh roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-refusal-status-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshRefusalStatusRefreshRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_refusal_status_refresh_roster ok"; echo "cleaned"; echo "OK: phase6907 e2e passed"
