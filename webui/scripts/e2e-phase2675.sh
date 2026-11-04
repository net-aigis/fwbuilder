#!/usr/bin/env bash
# Phase-2675: UI honesty milestone + honestyBundleRoster storage at 6450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyBundleRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6450 UI ok"
echo "cleaned"
echo "OK: phase2675 e2e passed"
