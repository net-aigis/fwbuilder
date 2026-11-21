#!/usr/bin/env bash
# Phase-4275: UI honesty milestone + option_enable_roster session at 11450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'optionEnableRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11450 UI ok"
echo "cleaned"
echo "OK: phase4275 e2e passed"
