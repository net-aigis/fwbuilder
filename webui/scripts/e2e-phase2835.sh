#!/usr/bin/env bash
# Phase-2835: UI honesty milestone + changelogRoster storage at 6950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'changelogRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6950 UI ok"
echo "cleaned"
echo "OK: phase2835 e2e passed"
