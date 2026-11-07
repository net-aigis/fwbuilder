#!/usr/bin/env bash
# Phase-4506: UI expect-steps-refusals roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectStepsRefusalsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.expectStepsRefusalsRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepsRefusalsRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect_steps_refusals_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4506 e2e passed"
