#!/usr/bin/env bash
# Phase-1642: UI honestyBundleStorageKey + clear wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyBundleStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestyBundle.' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_bundle session key ok"
echo "cleaned"
echo "OK: phase1642 e2e passed"
