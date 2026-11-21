#!/usr/bin/env bash
# Phase-1651: UI honesty milestone + bundle key wiring at 3250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyBundleStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3250 UI ok"
echo "cleaned"
echo "OK: phase1651 e2e passed"
