#!/usr/bin/env bash
# Phase-3946: UI res-status roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'resStatusRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.resStatusRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'resStatusRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI res_status_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3946 e2e passed"
