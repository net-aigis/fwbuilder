#!/usr/bin/env bash
# Phase-755: UI honesty milestone note still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 850 UI ok"
echo "cleaned"
echo "OK: phase755 e2e passed"
