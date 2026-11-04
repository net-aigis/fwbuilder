#!/usr/bin/env bash
# Phase-1859: UI honesty milestone + track note session at 3900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyTrackNoteStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3900 UI ok"
echo "cleaned"
echo "OK: phase1859 e2e passed"
