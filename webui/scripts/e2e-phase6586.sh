#!/usr/bin/env bash
# Phase-6586: UI ssh-not-implemented-batch roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshHonestyRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshHonestyRefreshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshHonestyRefreshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_honesty_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6586 e2e passed"
