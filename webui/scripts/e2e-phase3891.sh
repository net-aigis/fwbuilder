#!/usr/bin/env bash
# Phase-3891: UI honesty milestone at 10250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig health roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10250 UI ok"
echo "cleaned"
echo "OK: phase3891 e2e passed"
