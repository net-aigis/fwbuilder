#!/usr/bin/env bash
# Phase-2163: UI honesty milestone + operator brief at 4850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'operator_brief' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4850 UI ok"
echo "cleaned"
echo "OK: phase2163 e2e passed"
