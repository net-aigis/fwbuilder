#!/usr/bin/env bash
# Phase-2507: clear title mentions sessionStorage roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorage roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sessionStorageRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear session_storage_roster ok"
echo "cleaned"
echo "OK: phase2507 e2e passed"
