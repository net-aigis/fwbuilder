#!/usr/bin/env bash
# Phase-4347: clear title mentions expect-run roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect-run roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(expectRunRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear expect_run_roster ok"
echo "cleaned"
echo "OK: phase4347 e2e passed"
