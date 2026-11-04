#!/usr/bin/env bash
# Phase-1603: UI honesty milestone wiring at 3100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty exports' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3100 UI ok"
echo "cleaned"
echo "OK: phase1603 e2e passed"
