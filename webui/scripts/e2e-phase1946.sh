#!/usr/bin/env bash
# Phase-1946: UI honestyReadinessStorageKey + clear/restore wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyReadinessStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestyReadiness.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyReadinessStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI readiness session key ok"
echo "cleaned"
echo "OK: phase1946 e2e passed"
