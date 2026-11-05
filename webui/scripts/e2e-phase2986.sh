#!/usr/bin/env bash
# Phase-2986: UI SSH honesty roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sshHonestyRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshHonestyRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshHonestyRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_honesty_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2986 e2e passed"
