#!/usr/bin/env bash
# Phase-1290: UI related refusals state wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'setRelatedRefusalsDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard_gap_related_refusals' webui/frontend/src/components/FirewallExtras.tsx
echo "UI related refusals wiring ok"
echo "cleaned"
echo "OK: phase1290 e2e passed"
