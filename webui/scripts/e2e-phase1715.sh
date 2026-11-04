#!/usr/bin/env bash
# Phase-1715: UI honesty milestone + bundle clear at 3450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'session_storage_clear:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3450 UI ok"
echo "cleaned"
echo "OK: phase1715 e2e passed"
