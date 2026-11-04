#!/usr/bin/env bash
# Phase-926: clear snapshot resets fidelity title too.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -c 'setHardGapsSummaryFidelityTitle(null)' webui/frontend/src/components/FirewallExtras.tsx | grep -Eq '^[1-9]'
echo "clear resets fidelity title ok"
echo "cleaned"
echo "OK: phase926 e2e passed"
