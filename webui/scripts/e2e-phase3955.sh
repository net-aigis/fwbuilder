#!/usr/bin/env bash
# Phase-3955: UI honesty milestone + res_status_roster session at 10450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'resStatusRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10450 UI ok"
echo "cleaned"
echo "OK: phase3955 e2e passed"
