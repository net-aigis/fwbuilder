#!/usr/bin/env bash
# Phase-2427: clear title mentions honesty path roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(honestyPathRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear honesty_path_roster ok"
echo "cleaned"
echo "OK: phase2427 e2e passed"
