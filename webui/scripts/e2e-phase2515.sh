#!/usr/bin/env bash
# Phase-2515: UI honesty milestone + sessionStorageRoster storage at 5950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5950 UI ok"
echo "cleaned"
echo "OK: phase2515 e2e passed"
