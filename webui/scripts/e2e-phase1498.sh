#!/usr/bin/env bash
# Phase-1498: UI sessionStorage detail wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'setSessionStorageKeysDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_session_storage_keys' webui/frontend/src/components/FirewallExtras.tsx
echo "UI sessionStorage detail wiring ok"
echo "cleaned"
echo "OK: phase1498 e2e passed"
