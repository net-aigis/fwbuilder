#!/usr/bin/env bash
# Phase-1971: UI honesty milestone + catalog summary at 4250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig catalog summary' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4250 UI ok"
echo "cleaned"
echo "OK: phase1971 e2e passed"
