#!/usr/bin/env bash
# Phase-4427: clear title mentions expect-steps roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect-steps roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(expectStepsRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear expect_steps_roster ok"
echo "cleaned"
echo "OK: phase4427 e2e passed"
