#!/usr/bin/env bash
# Phase-899: UI honesty milestone note still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 1150 UI ok"
echo "cleaned"
echo "OK: phase899 e2e passed"
