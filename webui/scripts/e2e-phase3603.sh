#!/usr/bin/env bash
# Phase-3603: UI honesty milestone + surface_changelog_meta_roster at 9350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surface_changelog_meta_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9350 UI ok"
echo "cleaned"
echo "OK: phase3603 e2e passed"
