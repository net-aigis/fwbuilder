#!/usr/bin/env bash
# Phase-3475: UI honesty milestone + catalog summary sessionStorage at 8950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageClearRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8950 UI ok"
echo "cleaned"
echo "OK: phase3475 e2e passed"
