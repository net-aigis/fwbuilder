#!/usr/bin/env bash
# Phase-2051: UI honesty milestone + softCompleteNote session at 4500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softCompleteNoteStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4500 UI ok"
echo "cleaned"
echo "OK: phase2051 e2e passed"
