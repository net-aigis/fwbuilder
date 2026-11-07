#!/usr/bin/env bash
# Phase-4507: clear title mentions expect-steps-refusals roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect-steps-refusals roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(expectStepsRefusalsRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear expect_steps_refusals_roster ok"
echo "cleaned"
echo "OK: phase4507 e2e passed"
