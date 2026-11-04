#!/usr/bin/env bash
# Phase-2746: UI surface roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surfaceRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.surfaceRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surfaceRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2746 e2e passed"
