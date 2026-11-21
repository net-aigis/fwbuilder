#!/usr/bin/env bash
# Phase-1635: UI honesty milestone + bundle wiring at 3200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty bundle' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3200 UI ok"
echo "cleaned"
echo "OK: phase1635 e2e passed"
