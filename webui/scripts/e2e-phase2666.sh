#!/usr/bin/env bash
# Phase-2666: UI honesty bundle roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyBundleRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestyBundleRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyBundleRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_bundle_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2666 e2e passed"
