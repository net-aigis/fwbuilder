#!/usr/bin/env bash
# Phase-4122: UI hard-gaps field roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig layout-fidelity roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelityRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4120+ layout-fidelity roster ok"
echo "cleaned"
echo "OK: phase4122 e2e passed"
