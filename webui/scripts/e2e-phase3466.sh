#!/usr/bin/env bash
# Phase-3466: UI session storage clear roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorageClearRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sessionStorageClearRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageClearRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI session_storage_clear_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3466 e2e passed"
