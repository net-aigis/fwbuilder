#!/usr/bin/env bash
# Phase-2587: clear title mentions honesty export roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty export roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(honestyExportRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear honesty_export_roster ok"
echo "cleaned"
echo "OK: phase2587 e2e passed"
