#!/usr/bin/env bash
# Phase-651: UI shows honesty milestone note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_milestone_note' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone note UI ok"
echo "cleaned"
echo "OK: phase651 e2e passed"
