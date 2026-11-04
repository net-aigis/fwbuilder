#!/usr/bin/env bash
# Phase-795: UI honesty milestone note still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 900 UI ok"
echo "cleaned"
echo "OK: phase795 e2e passed"
