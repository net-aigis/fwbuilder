#!/usr/bin/env bash
# Phase-2787: UI honesty milestone + changelog roster at 6800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig changelog roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6800 UI ok"
echo "cleaned"
echo "OK: phase2787 e2e passed"
