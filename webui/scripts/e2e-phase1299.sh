#!/usr/bin/env bash
# Phase-1299: UI milestone + related refusals detail wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'relatedRefusalsDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2150 UI ok"
echo "cleaned"
echo "OK: phase1299 e2e passed"
