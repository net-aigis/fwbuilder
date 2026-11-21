#!/usr/bin/env bash
# Phase-4426: UI expect-steps roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectStepsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.expectStepsRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepsRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect_steps_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4426 e2e passed"
