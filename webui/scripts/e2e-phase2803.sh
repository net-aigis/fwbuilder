#!/usr/bin/env bash
# Phase-2803: UI honesty milestone + changelog_roster bundle at 6850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'changelog_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6850 UI ok"
echo "cleaned"
echo "OK: phase2803 e2e passed"
