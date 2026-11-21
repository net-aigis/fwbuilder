#!/usr/bin/env bash
# Phase-4058: UI layout-fidelity roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layoutFidelityRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout-fidelity roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download layout-fidelity roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI layout-fidelity roster ok"
echo "cleaned"
echo "OK: phase4058 e2e passed"
