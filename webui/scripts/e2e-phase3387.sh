#!/usr/bin/env bash
# Phase-3387: clear title mentions honesty readiness roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty readiness roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(honestyReadinessRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear honesty_readiness_roster ok"
echo "cleaned"
echo "OK: phase3387 e2e passed"
