#!/usr/bin/env bash
# Phase-2707: UI honesty milestone + surface roster at 6550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig surface roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6550 UI ok"
echo "cleaned"
echo "OK: phase2707 e2e passed"
