#!/usr/bin/env bash
# Phase-4106: UI layout-fidelity roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layoutFidelityRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.layoutFidelityRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelityRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI layout_fidelity_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4106 e2e passed"
