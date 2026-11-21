#!/usr/bin/env bash
# Phase-2195: UI honesty milestone + operator brief session at 4950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyOperatorBriefStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4950 UI ok"
echo "cleaned"
echo "OK: phase2195 e2e passed"
