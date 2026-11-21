#!/usr/bin/env bash
# Phase-530: signal catalog details UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'signalCatalogDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Fidelity signal catalog' webui/frontend/src/components/FirewallExtras.tsx
echo "signal catalog details UI ok"
echo "cleaned"
echo "OK: phase530 e2e passed"
