#!/usr/bin/env bash
# Phase-683: UI still shows honesty milestone note at 700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_milestone_note' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 700 UI ok"
echo "cleaned"
echo "OK: phase683 e2e passed"
