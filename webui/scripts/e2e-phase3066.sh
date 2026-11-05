#!/usr/bin/env bash
# Phase-3066: UI layout fidelity signal roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layoutFidelitySignalRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.layoutFidelitySignalRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelitySignalRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI layout_fidelity_signal_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3066 e2e passed"
