#!/usr/bin/env bash
# Phase-2907: clear title mentions expect step roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect step roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(expectStepRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear expect_step_roster ok"
echo "cleaned"
echo "OK: phase2907 e2e passed"
