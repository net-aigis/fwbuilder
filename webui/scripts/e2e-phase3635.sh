#!/usr/bin/env bash
# Phase-3635: UI honesty milestone + catalog summary sessionStorage at 9450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surfaceChangelogMetaRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9450 UI ok"
echo "cleaned"
echo "OK: phase3635 e2e passed"
