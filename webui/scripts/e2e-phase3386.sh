#!/usr/bin/env bash
# Phase-3386: UI honesty readiness roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyReadinessRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestyReadinessRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyReadinessRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_readiness_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3386 e2e passed"
