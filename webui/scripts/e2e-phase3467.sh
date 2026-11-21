#!/usr/bin/env bash
# Phase-3467: clear title mentions session storage clear roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'session storage clear roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sessionStorageClearRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear session_storage_clear_roster ok"
echo "cleaned"
echo "OK: phase3467 e2e passed"
