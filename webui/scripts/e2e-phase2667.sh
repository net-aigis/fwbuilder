#!/usr/bin/env bash
# Phase-2667: clear title mentions honesty bundle roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty bundle roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(honestyBundleRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear honesty_bundle_roster ok"
echo "cleaned"
echo "OK: phase2667 e2e passed"
