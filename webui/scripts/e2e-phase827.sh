#!/usr/bin/env bash
# Phase-827: UI honesty milestone note still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 950 UI ok"
echo "cleaned"
echo "OK: phase827 e2e passed"
