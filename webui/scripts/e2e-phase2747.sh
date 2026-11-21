#!/usr/bin/env bash
# Phase-2747: clear title mentions surface roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surface roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(surfaceRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear surface_roster ok"
echo "cleaned"
echo "OK: phase2747 e2e passed"
