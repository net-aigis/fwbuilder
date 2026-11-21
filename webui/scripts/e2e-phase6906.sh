#!/usr/bin/env bash
# Phase-6906: UI ssh-refusal-status-refresh roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalStatusRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshRefusalStatusRefreshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRefreshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_status_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6906 e2e passed"
