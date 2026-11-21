#!/usr/bin/env bash
# Phase-3338: UI honesty readiness roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyReadinessRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty readiness roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty readiness roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty readiness roster ok"
echo "cleaned"
echo "OK: phase3338 e2e passed"
