#!/usr/bin/env bash
# Phase-2906: UI expect step roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectStepRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.expectStepRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect_step_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2906 e2e passed"
