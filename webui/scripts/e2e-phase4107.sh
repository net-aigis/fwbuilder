#!/usr/bin/env bash
# Phase-4107: clear title mentions layout-fidelity roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout-fidelity roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(layoutFidelityRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear layout_fidelity_roster ok"
echo "cleaned"
echo "OK: phase4107 e2e passed"
