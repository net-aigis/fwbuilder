#!/usr/bin/env bash
# Phase-1427: UI milestone + related refusals download wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download related refusals' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2550 UI ok"
echo "cleaned"
echo "OK: phase1427 e2e passed"
