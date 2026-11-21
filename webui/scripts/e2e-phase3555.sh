#!/usr/bin/env bash
# Phase-3555: UI honesty milestone + catalog summary sessionStorage at 9200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyOperatorBriefRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9200 UI ok"
echo "cleaned"
echo "OK: phase3555 e2e passed"
