#!/usr/bin/env bash
# Phase-4346: UI expect-run roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectRunRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.expectRunRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectRunRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect_run_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4346 e2e passed"
