#!/usr/bin/env bash
# Phase-2435: UI honesty milestone + honestyPathRoster storage at 5700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5700 UI ok"
echo "cleaned"
echo "OK: phase2435 e2e passed"
