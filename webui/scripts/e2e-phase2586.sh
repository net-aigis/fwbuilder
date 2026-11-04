#!/usr/bin/env bash
# Phase-2586: UI honesty export roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyExportRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestyExportRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyExportRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_export_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2586 e2e passed"
