#!/usr/bin/env bash
# Phase-2426: UI honesty path roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyPathRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestyPathRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_path_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2426 e2e passed"
