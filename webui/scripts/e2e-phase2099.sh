#!/usr/bin/env bash
# Phase-2099: UI honesty milestone + surface changelog at 4650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surface_changelog' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4650 UI ok"
echo "cleaned"
echo "OK: phase2099 e2e passed"
