#!/usr/bin/env bash
# Phase-3067: clear title mentions layout fidelity signal roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout fidelity signal roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(layoutFidelitySignalRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear layout_fidelity_signal_roster ok"
echo "cleaned"
echo "OK: phase3067 e2e passed"
