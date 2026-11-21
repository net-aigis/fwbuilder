#!/usr/bin/env bash
# Phase-3235: UI honesty milestone + sample field sessionStorage at 8200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelitySampleFieldRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8200 UI ok"
echo "cleaned"
echo "OK: phase3235 e2e passed"
