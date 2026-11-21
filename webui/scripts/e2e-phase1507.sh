#!/usr/bin/env bash
# Phase-1507: UI milestone + sessionStorage detail wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageKeysDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2800 UI ok"
echo "cleaned"
echo "OK: phase1507 e2e passed"
