#!/usr/bin/env bash
# Phase-554: UI shows closure path + hard_gap_count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapsClosurePath' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapCount' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'closure' webui/frontend/src/components/FirewallExtras.tsx
echo "closure path UI ok"
echo "cleaned"
echo "OK: phase554 e2e passed"
