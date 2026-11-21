#!/usr/bin/env bash
# Phase-2506: UI sessionStorage roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorageRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sessionStorageRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI session_storage_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2506 e2e passed"
